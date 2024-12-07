import 'package:isar/isar.dart';
import 'package:runs/models/fall_of_wickets.dart';
import 'package:runs/models/models.dart';
import 'package:runs/screens/match_center/score_page/control_section/control_section.dart';
import 'package:runs/services/services.dart';

class ScoreService {
  ScoreService(Isar isar) : _isar = isar;

  final Isar _isar;

  late final ScoreboardService _scoreboardService;
  late final BatterService _batterService;
  late final BallService _ballService;
  late final PartnershipService _partnershipService;
  late final PartnershipBatterInfoService _partnershipBatterInfoService;
  late final PartnershipInfoService _partnershipInfoService;
  late final FallOfWicketsService _fallOfWicketsService;

  set scoreboardService(ScoreboardService scoreboardService) {
    _scoreboardService = scoreboardService;
  }

  set batterService(BatterService batterService) {
    _batterService = batterService;
  }

  set ballService(BallService ballService) {
    _ballService = ballService;
  }

  set partnershipService(PartnershipService service) {
    _partnershipService = service;
  }

  set partnershipBatterInfoService(PartnershipBatterInfoService service) {
    _partnershipBatterInfoService = service;
  }

  set partnershipInfoService(PartnershipInfoService service) {
    _partnershipInfoService = service;
  }

  set fallOfWicketsService(FallOfWicketsService service) {
    _fallOfWicketsService = service;
  }

  // Create the new score for the match and add the match  to the score.
  Future<void> createNewScore({required Match match}) async {
    final score = Score.newScore();
    await _isar.writeTxn(() async {
      // score added to the database.
      await _isar.scores.put(score);

      // link match with the score
      score.match.value = match;
      await score.match.save();
    });
  }

  // Stream the latest score of the match
  Stream<List<Score>> getLatestScore({required int matchId}) async* {
    yield* _isar.scores
        .filter()
        .match((match) {
          return match.idEqualTo(matchId);
        })
        .sortByDatetimeDesc()
        .limit(1)
        .watch(fireImmediately: true);
  }

  //Add the given player to the player on crease for the given score object.
  Future<void> addPlayerToPlayerOnCrease(
      {required Score score, required Player player}) async {
    await _isar.writeTxn(() async {
      score.playersOnCrease.add(player);
      await score.playersOnCrease.save();
      score.nextBattingPostion++;
      //to unlink the striker
      await score.striker.reset();
      await _isar.scores.put(score);
    });
  }

  Future<void> removePlayerFromPlayerOnCrease(
      {required Score score, required Player player}) async {
    await _isar.writeTxn(() async {
      score.playersOnCrease.remove(player);
      await score.playersOnCrease.save();
      //to unlink the striker
      await score.striker.reset();
      await _isar.scores.put(score);
    });
  }

  Future<void> updateStriker(
      {required Score score, required Player player}) async {
    await _isar.writeTxn(() async {
      score.striker.value = player;
      await score.striker.save();
      await _isar.scores.put(score);
    });
  }

  Future<(Score, Partnership)> getOrCreatePartnershipInfoHelper(
      {required Score score,
      required Score newscore,
      required Match match}) async {
    late final Partnership partnership;
    // partnership entry need to be resued that why this approach is different from the scorebaord method.
    await _isar.writeTxn(() async {
      final result = await _partnershipService.entryExists(
          players: score.playersOnCrease.toList(), matchId: match.id);
      if (result == null) {
        partnership = await _partnershipService.createPartnership(
            players: score.playersOnCrease.toList(),
            match: match,
            partnershipOrder: newscore.nextPartnershipOrder++);
        newscore.partnership.value = partnership;
      } else {
        partnership = result;
      }
    });
    return (newscore, partnership);
  }

  Future<Score> getOrCreateScoreboardentryHelper({
    required Score newscore,
    required Player striker,
    required Match match,
  }) async {
    // adding the scoreboard entry.
    final scoreboardEntryExists =
        await _scoreboardService.entryExists(player: striker, match: match);
    if (!scoreboardEntryExists) {
      // add the scoreboard entry for the player.
      final scoreboard = await _scoreboardService.addPlayer(
        player: striker,
        match: match,
        position: newscore.nextBattingPostion++,
      );
      newscore.socreboard.value = scoreboard;
    }
    return newscore;
  }

  Future<void> addRuns({
    required Runs runs,
    required Score score,
    required RunButtonType type,
  }) async {
    final match = score.match.value!;
    Score newscore = score.copyWith();
    final striker = score.striker.value!;
    Batter? newbatter;
    PartnershipBatterInfo? newPartnershipBatter;
    PartnershipInfo partnershipInfo;
    late Partnership partnership;
    final ball = Ball();

    // create or add the new partnership and returns the partnership.
    (newscore, partnership) = await getOrCreatePartnershipInfoHelper(
        score: score, newscore: newscore, match: match);

    // get partnerhsip info
    partnershipInfo = await _partnershipInfoService.getOrCreatePartnershipInfo(
        partnership: partnership, match: match);

    // create or get the batter
    if (type != RunButtonType.wide) {
      newbatter = await _batterService.getBatter(player: striker, match: match);

      //gets the partnership batter;
      newPartnershipBatter =
          await _partnershipBatterInfoService.getOrCreateBatter(
              player: striker, partnership: partnership, match: match);
    }

    // add the newscore to db.
    await _isar.writeTxn(() async {
      newscore = await getOrCreateScoreboardentryHelper(
          newscore: newscore, striker: striker, match: match);

      switch (type) {
        case RunButtonType.runs:
          newscore.ballsBowed++;

          newbatter!.addRuns(runs: runs);
          newbatter.balls++;

          newPartnershipBatter!.addRuns(runs: runs);
          newPartnershipBatter.balls++;

          partnershipInfo.balls++;

          ball.setBallTypeForRuns(runs: runs);

        case RunButtonType.wide:
          newscore.extras++;
          newscore.wide++;
          newscore.runs++;

          partnershipInfo.runs++;

          ball.ballType = BallType.wide;

        case RunButtonType.byes:
          newscore.ballsBowed++;
          newscore.extras++;

          newbatter!.balls++;
          newbatter.dots++;

          newPartnershipBatter!.balls++;
          newPartnershipBatter.dots++;

          partnershipInfo.balls++;

          ball.ballType = BallType.bye;
        case RunButtonType.legbyes:
          newscore.ballsBowed++;
          newscore.extras++;

          newbatter!.balls++;
          newbatter.dots++;

          newPartnershipBatter!.balls++;
          newPartnershipBatter.dots++;

          partnershipInfo.balls++;

          ball.ballType = BallType.legbye;

        case RunButtonType.noball:
          newscore.extras++;
          newscore.noball++;
          newscore.runs++;

          newbatter!.addRuns(runs: runs);
          newbatter.balls++;

          newPartnershipBatter!.addRuns(runs: runs);
          newPartnershipBatter.balls++;

          partnershipInfo.runs++;
          partnershipInfo.balls++;

          ball.ballType = BallType.noball;

        case RunButtonType.noballByes:
          newscore.extras++;
          newscore.noball++;
          newscore.runs++;

          newbatter!.balls++;
          newbatter.dots++;

          newPartnershipBatter!.balls++;
          newPartnershipBatter.dots++;

          partnershipInfo.runs++;
          partnershipInfo.balls++;

          ball.ballType = BallType.noballBye;

        case RunButtonType.noballLegByes:
          newscore.extras++;
          newscore.noball++;
          newscore.runs++;

          newbatter!.balls++;
          newbatter.dots++;

          newPartnershipBatter!.balls++;
          newPartnershipBatter.dots++;

          partnershipInfo.runs++;
          partnershipInfo.balls++;

          ball.ballType = BallType.noballLegbye;
      }
      if (newbatter != null) {
        await _isar.batters.put(newbatter);
      }
      if (newPartnershipBatter != null) {
        await _isar.partnershipBatterInfos.put(newPartnershipBatter);
      }

      switch (type) {
        case RunButtonType.runs:
        case RunButtonType.byes:
        case RunButtonType.legbyes:
          // compute the over for the newscore
          if (newscore.ballsBowed % 6 == 0) {
            newscore.currentOvers == newscore.ballsBowed ~/ 6 - 1;
          } else {
            newscore.currentOvers = newscore.ballsBowed ~/ 6;
          }
        case RunButtonType.wide:
        case RunButtonType.noball:
        case RunButtonType.noballByes:
        case RunButtonType.noballLegByes:
          // compute the over for the newscore
          if (newscore.ballsBowed % 6 == 0) {
            newscore.currentOvers = newscore.ballsBowed ~/ 6;
          }
      }

      // add the ball related stuff.
      ball.match.value = match;
      ball.over = newscore.currentOvers;
      ball.ball = score.ballsBowed % 6 + 1;
      ball.addNameandContent(runs: runs, type: type);
      ball.player.value = striker;
      await _isar.balls.put(ball);
      await ball.player.save();
      await ball.match.save();

      // this is for bye wide legbyes no ball
      newscore.addRuns(runs: runs);

      // object linking
      newscore.ball.value = ball; // ball
      newscore.batter.value = newbatter; // batter
      //scoreboard is initialized in scoreboard entry,
      newscore.partnershipBatterInfo.value = newPartnershipBatter;

      // partnership info linking.
      // this is for bye wide legbyes no ball
      partnershipInfo.addRuns(runs: runs);
      await _isar.partnershipInfos.put(partnershipInfo);
      newscore.partnerShipInfo.value = partnershipInfo;

      //partnership is lined in partnership section.

      await _isar.scores.put(newscore); // putting.

      await newscore.playersOnCrease
          .save(); //  save copied form previous scoreboard
      await newscore.updateStriker(
          striker: striker, runs: runs, previousOver: score.ballsBowed);
      await newscore.match.save(); // copied form previous score board.
      await newscore.ball.save(); //ball save
      await newscore.batter.save(); // batter save
      await newscore.socreboard.save(); // object save
      await newscore.partnership.save();
      await newscore.partnerShipInfo.save();
      await newscore.partnershipBatterInfo.save();
    });
  }

  Future<void> bowled({
    required Score score,
    required WicketType wicketType,
  }) async {
    final match = score.match.value!;
    Score newscore = score.copyWith();
    final striker = score.striker.value!;
    Batter newbatter;
    PartnershipBatterInfo newPartnershipBatter;
    PartnershipInfo partnershipInfo;
    late Partnership partnership;
    final ball = Ball();

    // create or add the new partnership and returns the partnership.
    (newscore, partnership) = await getOrCreatePartnershipInfoHelper(
        score: score, newscore: newscore, match: match);

    newbatter = await _batterService.getBatter(player: striker, match: match);

    newPartnershipBatter =
        await _partnershipBatterInfoService.getOrCreateBatter(
            player: striker, partnership: partnership, match: match);

    partnershipInfo = await _partnershipInfoService.getOrCreatePartnershipInfo(
        partnership: partnership, match: match);

    await _isar.writeTxn(() async {
      newscore = await getOrCreateScoreboardentryHelper(
          newscore: newscore, striker: striker, match: match);
      newscore.ballsBowed++;
      newscore.wicketsFall++;
      newscore.dots++;

      newbatter.balls++;
      newbatter.dots++;

      newPartnershipBatter.balls++;
      newPartnershipBatter.dots++;

      partnershipInfo.dots++;
      partnershipInfo.balls++;

      ball.ballType = BallType.wicket;

      switch (wicketType) {
        case WicketType.bowled:
          newbatter.status = BatterStatus.bowled;
          ball.content = 'Bowled';
        case WicketType.lbw:
          newbatter.status = BatterStatus.lbw;
          ball.content = 'lbw';
        case WicketType.caugth:
          newbatter.status = BatterStatus.caugth;
          ball.content = 'caught';
        case WicketType.hitwicket:
          newbatter.status = BatterStatus.htiwicket;
          ball.content = 'hitwicket';
        case WicketType.stumped:
          break;
        case WicketType.runout:
          break;
      }

      // compute the over for the newscore
      if (newscore.ballsBowed % 6 == 0) {
        newscore.currentOvers == newscore.ballsBowed ~/ 6 - 1;
      } else {
        newscore.currentOvers = newscore.ballsBowed ~/ 6;
      }

      await _isar.batters.put(newbatter);
      await _isar.partnershipBatterInfos.put(newPartnershipBatter);

      ball.match.value = match;
      ball.over = newscore.currentOvers;
      ball.ball = score.ballsBowed % 6 + 1;
      ball.player.value = striker;
      ball.name = 'W';
      await _isar.balls.put(ball);
      await ball.player.save();
      await ball.match.save();

      // for fall of wickets;
      final fallOfWickets = FallOfWickets(
        over: newscore.ballsBowed ~/ 6,
        ball: newscore.ballsBowed % 6,
        run: newscore.runs,
      );
      fallOfWickets.player.value = striker;
      fallOfWickets.match.value = match;
      await _isar.fallOfWickets.put(fallOfWickets);
      await fallOfWickets.player.save();
      await fallOfWickets.match.save();
      newscore.fallOfWickets.value = fallOfWickets;

      newscore.ball.value = ball;
      newscore.batter.value = newbatter;

      newscore.partnershipBatterInfo.value = newPartnershipBatter;

      // partnership info linking.
      // this is for bye wide legbyes no ball
      await _isar.partnershipInfos.put(partnershipInfo);
      newscore.partnerShipInfo.value = partnershipInfo;
      //partnership is lined in partnership section.

      newscore.playersOnCrease.remove(striker);

      await _isar.scores.put(newscore); // putting.

      //partnership is lined in partnership section.

      await _isar.scores.put(newscore); // putting.

      await newscore.playersOnCrease
          .save(); //  save copied form previous scoreboard
      await newscore.match.save(); // copied form previous score board.
      await newscore.ball.save(); //ball save
      await newscore.batter.save(); // batter save
      await newscore.socreboard.save(); // object save
      await newscore.partnership.save();
      await newscore.partnerShipInfo.save();
      await newscore.partnershipBatterInfo.save();
      await newscore.fallOfWickets.save();
    });
  }

  Future<void> undoScore({required Score score}) async {
    final ball = score.ball.value;
    final batter = score.batter.value;
    final scoreboard = score.socreboard.value;
    final partnershipBatterInfo = score.partnershipBatterInfo.value;
    final partnershipInfo = score.partnerShipInfo.value;
    final partnership = score.partnership.value;
    final fallOfWickets = score.fallOfWickets.value;

    if (ball != null) {
      await _ballService.deleteBall(ball.id);
    }
    if (batter != null) {
      await _batterService.deleteBatter(batter.id);
    }
    if (scoreboard != null) {
      await _scoreboardService.deleteScorebaord(scoreboard.id);
    }

    if (partnershipBatterInfo != null) {
      await _partnershipBatterInfoService
          .deleteBatterInfo(partnershipBatterInfo.id);
    }

    if (partnershipInfo != null) {
      await _partnershipInfoService.deletePartnershipInfo(partnershipInfo.id);
    }

    if (partnership != null) {
      await _partnershipService.deletePartnership(partnership.id);
    }

    if (fallOfWickets != null) {
      await _fallOfWicketsService.deleteFallOfWickets(fallOfWickets.id);
    }

    await _isar.writeTxn(() async {
      await _isar.scores.delete(score.id);
    });
  }
}
