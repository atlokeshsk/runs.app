// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMatchCollection on Isar {
  IsarCollection<Match> get matches => this.collection();
}

const MatchSchema = CollectionSchema(
  name: r'Match',
  id: -4384922031457139852,
  properties: {
    r'countRunsForNoBall': PropertySchema(
      id: 0,
      name: r'countRunsForNoBall',
      type: IsarType.bool,
    ),
    r'countRunsForWide': PropertySchema(
      id: 1,
      name: r'countRunsForWide',
      type: IsarType.bool,
    ),
    r'dateTime': PropertySchema(
      id: 2,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'innings': PropertySchema(
      id: 3,
      name: r'innings',
      type: IsarType.byte,
      enumMap: _MatchinningsEnumValueMap,
    ),
    r'lastManStanding': PropertySchema(
      id: 4,
      name: r'lastManStanding',
      type: IsarType.bool,
    ),
    r'opponentName': PropertySchema(
      id: 5,
      name: r'opponentName',
      type: IsarType.string,
    ),
    r'overs': PropertySchema(
      id: 6,
      name: r'overs',
      type: IsarType.long,
    ),
    r'playersCount': PropertySchema(
      id: 7,
      name: r'playersCount',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 8,
      name: r'status',
      type: IsarType.byte,
      enumMap: _MatchstatusEnumValueMap,
    ),
    r'target': PropertySchema(
      id: 9,
      name: r'target',
      type: IsarType.long,
    ),
    r'venue': PropertySchema(
      id: 10,
      name: r'venue',
      type: IsarType.string,
    )
  },
  estimateSize: _matchEstimateSize,
  serialize: _matchSerialize,
  deserialize: _matchDeserialize,
  deserializeProp: _matchDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'team': LinkSchema(
      id: 5758924364491295213,
      name: r'team',
      target: r'Team',
      single: true,
    ),
    r'score': LinkSchema(
      id: 6362458433022665126,
      name: r'score',
      target: r'Score',
      single: false,
      linkName: r'match',
    ),
    r'batters': LinkSchema(
      id: 660548386669744147,
      name: r'batters',
      target: r'Batter',
      single: false,
      linkName: r'match',
    )
  },
  embeddedSchemas: {},
  getId: _matchGetId,
  getLinks: _matchGetLinks,
  attach: _matchAttach,
  version: '3.1.8',
);

int _matchEstimateSize(
  Match object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.opponentName.length * 3;
  bytesCount += 3 + object.venue.length * 3;
  return bytesCount;
}

void _matchSerialize(
  Match object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.countRunsForNoBall);
  writer.writeBool(offsets[1], object.countRunsForWide);
  writer.writeDateTime(offsets[2], object.dateTime);
  writer.writeByte(offsets[3], object.innings.index);
  writer.writeBool(offsets[4], object.lastManStanding);
  writer.writeString(offsets[5], object.opponentName);
  writer.writeLong(offsets[6], object.overs);
  writer.writeLong(offsets[7], object.playersCount);
  writer.writeByte(offsets[8], object.status.index);
  writer.writeLong(offsets[9], object.target);
  writer.writeString(offsets[10], object.venue);
}

Match _matchDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Match(
    countRunsForNoBall: reader.readBoolOrNull(offsets[0]) ?? true,
    countRunsForWide: reader.readBoolOrNull(offsets[1]) ?? true,
    innings: _MatchinningsValueEnumMap[reader.readByteOrNull(offsets[3])] ??
        Innings.first,
    lastManStanding: reader.readBool(offsets[4]),
    opponentName: reader.readString(offsets[5]),
    overs: reader.readLong(offsets[6]),
    playersCount: reader.readLong(offsets[7]),
    status: _MatchstatusValueEnumMap[reader.readByteOrNull(offsets[8])] ??
        Status.inprogress,
    target: reader.readLongOrNull(offsets[9]),
    venue: reader.readString(offsets[10]),
  );
  object.dateTime = reader.readDateTime(offsets[2]);
  object.id = id;
  return object;
}

P _matchDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? true) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (_MatchinningsValueEnumMap[reader.readByteOrNull(offset)] ??
          Innings.first) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (_MatchstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          Status.inprogress) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _MatchinningsEnumValueMap = {
  'first': 0,
  'second': 1,
};
const _MatchinningsValueEnumMap = {
  0: Innings.first,
  1: Innings.second,
};
const _MatchstatusEnumValueMap = {
  'inprogress': 0,
  'completed': 1,
};
const _MatchstatusValueEnumMap = {
  0: Status.inprogress,
  1: Status.completed,
};

Id _matchGetId(Match object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _matchGetLinks(Match object) {
  return [object.team, object.score, object.batters];
}

void _matchAttach(IsarCollection<dynamic> col, Id id, Match object) {
  object.id = id;
  object.team.attach(col, col.isar.collection<Team>(), r'team', id);
  object.score.attach(col, col.isar.collection<Score>(), r'score', id);
  object.batters.attach(col, col.isar.collection<Batter>(), r'batters', id);
}

extension MatchQueryWhereSort on QueryBuilder<Match, Match, QWhere> {
  QueryBuilder<Match, Match, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MatchQueryWhere on QueryBuilder<Match, Match, QWhereClause> {
  QueryBuilder<Match, Match, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Match, Match, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Match, Match, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Match, Match, QAfterWhereClause> idBetween(
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

extension MatchQueryFilter on QueryBuilder<Match, Match, QFilterCondition> {
  QueryBuilder<Match, Match, QAfterFilterCondition> countRunsForNoBallEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countRunsForNoBall',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> countRunsForWideEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countRunsForWide',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> dateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dateTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Match, Match, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Match, Match, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Match, Match, QAfterFilterCondition> inningsEqualTo(
      Innings value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'innings',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> inningsGreaterThan(
    Innings value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'innings',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> inningsLessThan(
    Innings value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'innings',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> inningsBetween(
    Innings lower,
    Innings upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'innings',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> lastManStandingEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastManStanding',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'opponentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'opponentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'opponentName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'opponentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'opponentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'opponentName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'opponentName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'opponentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> opponentNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'opponentName',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> oversEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'overs',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> oversGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'overs',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> oversLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'overs',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> oversBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'overs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> playersCountEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'playersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> playersCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'playersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> playersCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'playersCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> playersCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'playersCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> statusEqualTo(
      Status value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> statusGreaterThan(
    Status value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> statusLessThan(
    Status value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> statusBetween(
    Status lower,
    Status upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'status',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> targetIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'target',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> targetIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'target',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> targetEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'target',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> targetGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'target',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> targetLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'target',
        value: value,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> targetBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'target',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'venue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'venue',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'venue',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'venue',
        value: '',
      ));
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> venueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'venue',
        value: '',
      ));
    });
  }
}

extension MatchQueryObject on QueryBuilder<Match, Match, QFilterCondition> {}

extension MatchQueryLinks on QueryBuilder<Match, Match, QFilterCondition> {
  QueryBuilder<Match, Match, QAfterFilterCondition> team(FilterQuery<Team> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'team');
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> teamIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'team', 0, true, 0, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> score(
      FilterQuery<Score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'score');
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> scoreLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'score', length, true, length, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> scoreIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'score', 0, true, 0, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> scoreIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'score', 0, false, 999999, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> scoreLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'score', 0, true, length, include);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> scoreLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'score', length, include, 999999, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> scoreLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'score', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> batters(
      FilterQuery<Batter> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'batters');
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> battersLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'batters', length, true, length, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> battersIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'batters', 0, true, 0, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> battersIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'batters', 0, false, 999999, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> battersLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'batters', 0, true, length, include);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> battersLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'batters', length, include, 999999, true);
    });
  }

  QueryBuilder<Match, Match, QAfterFilterCondition> battersLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'batters', lower, includeLower, upper, includeUpper);
    });
  }
}

extension MatchQuerySortBy on QueryBuilder<Match, Match, QSortBy> {
  QueryBuilder<Match, Match, QAfterSortBy> sortByCountRunsForNoBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForNoBall', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByCountRunsForNoBallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForNoBall', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByCountRunsForWide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForWide', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByCountRunsForWideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForWide', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByInnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'innings', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByInningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'innings', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByLastManStanding() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastManStanding', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByLastManStandingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastManStanding', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByOpponentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentName', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByOpponentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentName', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByOvers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overs', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByOversDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overs', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByPlayersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playersCount', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByPlayersCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playersCount', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> sortByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension MatchQuerySortThenBy on QueryBuilder<Match, Match, QSortThenBy> {
  QueryBuilder<Match, Match, QAfterSortBy> thenByCountRunsForNoBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForNoBall', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByCountRunsForNoBallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForNoBall', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByCountRunsForWide() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForWide', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByCountRunsForWideDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countRunsForWide', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByInnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'innings', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByInningsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'innings', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByLastManStanding() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastManStanding', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByLastManStandingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastManStanding', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByOpponentName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentName', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByOpponentNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'opponentName', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByOvers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overs', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByOversDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'overs', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByPlayersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playersCount', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByPlayersCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'playersCount', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByTargetDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'target', Sort.desc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByVenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.asc);
    });
  }

  QueryBuilder<Match, Match, QAfterSortBy> thenByVenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'venue', Sort.desc);
    });
  }
}

extension MatchQueryWhereDistinct on QueryBuilder<Match, Match, QDistinct> {
  QueryBuilder<Match, Match, QDistinct> distinctByCountRunsForNoBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countRunsForNoBall');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByCountRunsForWide() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countRunsForWide');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByInnings() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'innings');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByLastManStanding() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastManStanding');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByOpponentName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'opponentName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByOvers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'overs');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByPlayersCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'playersCount');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByTarget() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'target');
    });
  }

  QueryBuilder<Match, Match, QDistinct> distinctByVenue(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'venue', caseSensitive: caseSensitive);
    });
  }
}

extension MatchQueryProperty on QueryBuilder<Match, Match, QQueryProperty> {
  QueryBuilder<Match, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Match, bool, QQueryOperations> countRunsForNoBallProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countRunsForNoBall');
    });
  }

  QueryBuilder<Match, bool, QQueryOperations> countRunsForWideProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countRunsForWide');
    });
  }

  QueryBuilder<Match, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<Match, Innings, QQueryOperations> inningsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'innings');
    });
  }

  QueryBuilder<Match, bool, QQueryOperations> lastManStandingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastManStanding');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> opponentNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'opponentName');
    });
  }

  QueryBuilder<Match, int, QQueryOperations> oversProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'overs');
    });
  }

  QueryBuilder<Match, int, QQueryOperations> playersCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'playersCount');
    });
  }

  QueryBuilder<Match, Status, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Match, int?, QQueryOperations> targetProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'target');
    });
  }

  QueryBuilder<Match, String, QQueryOperations> venueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'venue');
    });
  }
}
