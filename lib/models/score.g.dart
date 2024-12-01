// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScoreCollection on Isar {
  IsarCollection<Score> get scores => this.collection();
}

const ScoreSchema = CollectionSchema(
  name: r'Score',
  id: -357457489503241584,
  properties: {
    r'datetime': PropertySchema(
      id: 0,
      name: r'datetime',
      type: IsarType.dateTime,
    ),
    r'dots': PropertySchema(
      id: 1,
      name: r'dots',
      type: IsarType.long,
    ),
    r'extras': PropertySchema(
      id: 2,
      name: r'extras',
      type: IsarType.long,
    ),
    r'fours': PropertySchema(
      id: 3,
      name: r'fours',
      type: IsarType.long,
    ),
    r'nextBattingPostion': PropertySchema(
      id: 4,
      name: r'nextBattingPostion',
      type: IsarType.long,
    ),
    r'noball': PropertySchema(
      id: 5,
      name: r'noball',
      type: IsarType.long,
    ),
    r'ones': PropertySchema(
      id: 6,
      name: r'ones',
      type: IsarType.long,
    ),
    r'oversCompleted': PropertySchema(
      id: 7,
      name: r'oversCompleted',
      type: IsarType.long,
    ),
    r'runs': PropertySchema(
      id: 8,
      name: r'runs',
      type: IsarType.long,
    ),
    r'sixes': PropertySchema(
      id: 9,
      name: r'sixes',
      type: IsarType.long,
    ),
    r'threes': PropertySchema(
      id: 10,
      name: r'threes',
      type: IsarType.long,
    ),
    r'twos': PropertySchema(
      id: 11,
      name: r'twos',
      type: IsarType.long,
    ),
    r'wicketsFall': PropertySchema(
      id: 12,
      name: r'wicketsFall',
      type: IsarType.long,
    ),
    r'wide': PropertySchema(
      id: 13,
      name: r'wide',
      type: IsarType.long,
    )
  },
  estimateSize: _scoreEstimateSize,
  serialize: _scoreSerialize,
  deserialize: _scoreDeserialize,
  deserializeProp: _scoreDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'playersOnCrease': LinkSchema(
      id: -8205666275342837044,
      name: r'playersOnCrease',
      target: r'Player',
      single: false,
    ),
    r'striker': LinkSchema(
      id: -3997232902808028092,
      name: r'striker',
      target: r'Player',
      single: true,
    ),
    r'match': LinkSchema(
      id: 4260769241188215219,
      name: r'match',
      target: r'Match',
      single: true,
    ),
    r'ball': LinkSchema(
      id: 667850299510636346,
      name: r'ball',
      target: r'Ball',
      single: true,
    ),
    r'batter': LinkSchema(
      id: -5053710747220821746,
      name: r'batter',
      target: r'Batter',
      single: true,
    ),
    r'socreboard': LinkSchema(
      id: 4423202444091048867,
      name: r'socreboard',
      target: r'ScoreBoard',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _scoreGetId,
  getLinks: _scoreGetLinks,
  attach: _scoreAttach,
  version: '3.1.8',
);

int _scoreEstimateSize(
  Score object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scoreSerialize(
  Score object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.datetime);
  writer.writeLong(offsets[1], object.dots);
  writer.writeLong(offsets[2], object.extras);
  writer.writeLong(offsets[3], object.fours);
  writer.writeLong(offsets[4], object.nextBattingPostion);
  writer.writeLong(offsets[5], object.noball);
  writer.writeLong(offsets[6], object.ones);
  writer.writeLong(offsets[7], object.oversCompleted);
  writer.writeLong(offsets[8], object.runs);
  writer.writeLong(offsets[9], object.sixes);
  writer.writeLong(offsets[10], object.threes);
  writer.writeLong(offsets[11], object.twos);
  writer.writeLong(offsets[12], object.wicketsFall);
  writer.writeLong(offsets[13], object.wide);
}

Score _scoreDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Score(
    dots: reader.readLong(offsets[1]),
    extras: reader.readLong(offsets[2]),
    fours: reader.readLong(offsets[3]),
    nextBattingPostion: reader.readLong(offsets[4]),
    noball: reader.readLong(offsets[5]),
    ones: reader.readLong(offsets[6]),
    oversCompleted: reader.readLong(offsets[7]),
    runs: reader.readLong(offsets[8]),
    sixes: reader.readLong(offsets[9]),
    threes: reader.readLong(offsets[10]),
    twos: reader.readLong(offsets[11]),
    wicketsFall: reader.readLong(offsets[12]),
    wide: reader.readLong(offsets[13]),
  );
  object.datetime = reader.readDateTime(offsets[0]);
  object.id = id;
  return object;
}

P _scoreDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _scoreGetId(Score object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scoreGetLinks(Score object) {
  return [
    object.playersOnCrease,
    object.striker,
    object.match,
    object.ball,
    object.batter,
    object.socreboard
  ];
}

void _scoreAttach(IsarCollection<dynamic> col, Id id, Score object) {
  object.id = id;
  object.playersOnCrease
      .attach(col, col.isar.collection<Player>(), r'playersOnCrease', id);
  object.striker.attach(col, col.isar.collection<Player>(), r'striker', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
  object.ball.attach(col, col.isar.collection<Ball>(), r'ball', id);
  object.batter.attach(col, col.isar.collection<Batter>(), r'batter', id);
  object.socreboard
      .attach(col, col.isar.collection<ScoreBoard>(), r'socreboard', id);
}

extension ScoreQueryWhereSort on QueryBuilder<Score, Score, QWhere> {
  QueryBuilder<Score, Score, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScoreQueryWhere on QueryBuilder<Score, Score, QWhereClause> {
  QueryBuilder<Score, Score, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Score, Score, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScoreQueryFilter on QueryBuilder<Score, Score, QFilterCondition> {
  QueryBuilder<Score, Score, QAfterFilterCondition> datetimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> datetimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> datetimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> datetimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'datetime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dotsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dots',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dotsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dots',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dotsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dots',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> dotsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dots',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> extrasEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'extras',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> extrasGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'extras',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> extrasLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'extras',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> extrasBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'extras',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> foursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fours',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> foursGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fours',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> foursLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fours',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> foursBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fours',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> nextBattingPostionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nextBattingPostion',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition>
      nextBattingPostionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nextBattingPostion',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> nextBattingPostionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nextBattingPostion',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> nextBattingPostionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nextBattingPostion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> noballEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'noball',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> noballGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'noball',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> noballLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'noball',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> noballBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'noball',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> onesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ones',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> onesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ones',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> onesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ones',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> onesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ones',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> oversCompletedEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'oversCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> oversCompletedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'oversCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> oversCompletedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'oversCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> oversCompletedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'oversCompleted',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> runsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'runs',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> runsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'runs',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> runsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'runs',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> runsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'runs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> sixesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sixes',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> sixesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sixes',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> sixesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sixes',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> sixesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sixes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> threesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'threes',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> threesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'threes',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> threesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'threes',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> threesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'threes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> twosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twos',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> twosGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'twos',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> twosLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'twos',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> twosBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'twos',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wicketsFallEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wicketsFall',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wicketsFallGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wicketsFall',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wicketsFallLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wicketsFall',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wicketsFallBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wicketsFall',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wideEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'wide',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wideGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'wide',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wideLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'wide',
        value: value,
      ));
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> wideBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'wide',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScoreQueryObject on QueryBuilder<Score, Score, QFilterCondition> {}

extension ScoreQueryLinks on QueryBuilder<Score, Score, QFilterCondition> {
  QueryBuilder<Score, Score, QAfterFilterCondition> playersOnCrease(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'playersOnCrease');
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition>
      playersOnCreaseLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playersOnCrease', length, true, length, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> playersOnCreaseIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playersOnCrease', 0, true, 0, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition>
      playersOnCreaseIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playersOnCrease', 0, false, 999999, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition>
      playersOnCreaseLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playersOnCrease', 0, true, length, include);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition>
      playersOnCreaseLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'playersOnCrease', length, include, 999999, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition>
      playersOnCreaseLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'playersOnCrease', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> striker(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'striker');
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> strikerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'striker', 0, true, 0, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> match(
      FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> ball(FilterQuery<Ball> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'ball');
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> ballIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'ball', 0, true, 0, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> batter(
      FilterQuery<Batter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'batter');
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> batterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'batter', 0, true, 0, true);
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> socreboard(
      FilterQuery<ScoreBoard> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'socreboard');
    });
  }

  QueryBuilder<Score, Score, QAfterFilterCondition> socreboardIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'socreboard', 0, true, 0, true);
    });
  }
}

extension ScoreQuerySortBy on QueryBuilder<Score, Score, QSortBy> {
  QueryBuilder<Score, Score, QAfterSortBy> sortByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByExtras() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extras', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByExtrasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extras', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByNextBattingPostion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBattingPostion', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByNextBattingPostionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBattingPostion', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByNoball() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noball', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByNoballDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noball', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByOversCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oversCompleted', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByOversCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oversCompleted', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByWicketsFall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wicketsFall', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByWicketsFallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wicketsFall', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByWide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wide', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> sortByWideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wide', Sort.desc);
    });
  }
}

extension ScoreQuerySortThenBy on QueryBuilder<Score, Score, QSortThenBy> {
  QueryBuilder<Score, Score, QAfterSortBy> thenByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByExtras() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extras', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByExtrasDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'extras', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByNextBattingPostion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBattingPostion', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByNextBattingPostionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nextBattingPostion', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByNoball() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noball', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByNoballDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'noball', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByOversCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oversCompleted', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByOversCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'oversCompleted', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByWicketsFall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wicketsFall', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByWicketsFallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wicketsFall', Sort.desc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByWide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wide', Sort.asc);
    });
  }

  QueryBuilder<Score, Score, QAfterSortBy> thenByWideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'wide', Sort.desc);
    });
  }
}

extension ScoreQueryWhereDistinct on QueryBuilder<Score, Score, QDistinct> {
  QueryBuilder<Score, Score, QDistinct> distinctByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datetime');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dots');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByExtras() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'extras');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fours');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByNextBattingPostion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nextBattingPostion');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByNoball() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'noball');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ones');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByOversCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'oversCompleted');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runs');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sixes');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'threes');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twos');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByWicketsFall() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wicketsFall');
    });
  }

  QueryBuilder<Score, Score, QDistinct> distinctByWide() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'wide');
    });
  }
}

extension ScoreQueryProperty on QueryBuilder<Score, Score, QQueryProperty> {
  QueryBuilder<Score, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Score, DateTime, QQueryOperations> datetimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datetime');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> dotsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dots');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> extrasProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'extras');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> foursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fours');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> nextBattingPostionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nextBattingPostion');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> noballProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'noball');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> onesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ones');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> oversCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'oversCompleted');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> runsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runs');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> sixesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sixes');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> threesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'threes');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> twosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twos');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> wicketsFallProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wicketsFall');
    });
  }

  QueryBuilder<Score, int, QQueryOperations> wideProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'wide');
    });
  }
}
