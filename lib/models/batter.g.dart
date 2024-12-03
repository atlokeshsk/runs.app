// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBatterCollection on Isar {
  IsarCollection<Batter> get batters => this.collection();
}

const BatterSchema = CollectionSchema(
  name: r'Batter',
  id: 5152740563335277452,
  properties: {
    r'balls': PropertySchema(
      id: 0,
      name: r'balls',
      type: IsarType.long,
    ),
    r'dateTime': PropertySchema(
      id: 1,
      name: r'dateTime',
      type: IsarType.dateTime,
    ),
    r'dots': PropertySchema(
      id: 2,
      name: r'dots',
      type: IsarType.long,
    ),
    r'fours': PropertySchema(
      id: 3,
      name: r'fours',
      type: IsarType.long,
    ),
    r'ones': PropertySchema(
      id: 4,
      name: r'ones',
      type: IsarType.long,
    ),
    r'runs': PropertySchema(
      id: 5,
      name: r'runs',
      type: IsarType.long,
    ),
    r'sixes': PropertySchema(
      id: 6,
      name: r'sixes',
      type: IsarType.long,
    ),
    r'status': PropertySchema(
      id: 7,
      name: r'status',
      type: IsarType.byte,
      enumMap: _BatterstatusEnumValueMap,
    ),
    r'threes': PropertySchema(
      id: 8,
      name: r'threes',
      type: IsarType.long,
    ),
    r'twos': PropertySchema(
      id: 9,
      name: r'twos',
      type: IsarType.long,
    )
  },
  estimateSize: _batterEstimateSize,
  serialize: _batterSerialize,
  deserialize: _batterDeserialize,
  deserializeProp: _batterDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'player': LinkSchema(
      id: -1000173460412487456,
      name: r'player',
      target: r'Player',
      single: true,
      linkName: r'batters',
    ),
    r'match': LinkSchema(
      id: 6555530344206152273,
      name: r'match',
      target: r'Match',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _batterGetId,
  getLinks: _batterGetLinks,
  attach: _batterAttach,
  version: '3.1.8',
);

int _batterEstimateSize(
  Batter object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _batterSerialize(
  Batter object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.balls);
  writer.writeDateTime(offsets[1], object.dateTime);
  writer.writeLong(offsets[2], object.dots);
  writer.writeLong(offsets[3], object.fours);
  writer.writeLong(offsets[4], object.ones);
  writer.writeLong(offsets[5], object.runs);
  writer.writeLong(offsets[6], object.sixes);
  writer.writeByte(offsets[7], object.status.index);
  writer.writeLong(offsets[8], object.threes);
  writer.writeLong(offsets[9], object.twos);
}

Batter _batterDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Batter();
  object.balls = reader.readLong(offsets[0]);
  object.dateTime = reader.readDateTime(offsets[1]);
  object.dots = reader.readLong(offsets[2]);
  object.fours = reader.readLong(offsets[3]);
  object.id = id;
  object.ones = reader.readLong(offsets[4]);
  object.runs = reader.readLong(offsets[5]);
  object.sixes = reader.readLong(offsets[6]);
  object.status =
      _BatterstatusValueEnumMap[reader.readByteOrNull(offsets[7])] ??
          BatterStatus.bowled;
  object.threes = reader.readLong(offsets[8]);
  object.twos = reader.readLong(offsets[9]);
  return object;
}

P _batterDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
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
      return (_BatterstatusValueEnumMap[reader.readByteOrNull(offset)] ??
          BatterStatus.bowled) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BatterstatusEnumValueMap = {
  'bowled': 0,
  'caugth': 1,
  'stupmed': 2,
  'lbw': 3,
  'runout': 4,
  'retiredOut': 5,
  'retiredHurt': 6,
  'playing': 7,
  'notout': 8,
};
const _BatterstatusValueEnumMap = {
  0: BatterStatus.bowled,
  1: BatterStatus.caugth,
  2: BatterStatus.stupmed,
  3: BatterStatus.lbw,
  4: BatterStatus.runout,
  5: BatterStatus.retiredOut,
  6: BatterStatus.retiredHurt,
  7: BatterStatus.playing,
  8: BatterStatus.notout,
};

Id _batterGetId(Batter object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _batterGetLinks(Batter object) {
  return [object.player, object.match];
}

void _batterAttach(IsarCollection<dynamic> col, Id id, Batter object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
}

extension BatterQueryWhereSort on QueryBuilder<Batter, Batter, QWhere> {
  QueryBuilder<Batter, Batter, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BatterQueryWhere on QueryBuilder<Batter, Batter, QWhereClause> {
  QueryBuilder<Batter, Batter, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Batter, Batter, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Batter, Batter, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Batter, Batter, QAfterWhereClause> idBetween(
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

extension BatterQueryFilter on QueryBuilder<Batter, Batter, QFilterCondition> {
  QueryBuilder<Batter, Batter, QAfterFilterCondition> ballsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balls',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> ballsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'balls',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> ballsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'balls',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> ballsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'balls',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dateTimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dateTimeGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dateTimeLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dateTimeBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dotsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dots',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dotsGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dotsLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> dotsBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> foursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fours',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> foursGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> foursLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> foursBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> onesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ones',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> onesGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> onesLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> onesBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> runsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'runs',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> runsGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> runsLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> runsBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> sixesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sixes',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> sixesGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> sixesLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> sixesBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> statusEqualTo(
      BatterStatus value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'status',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> statusGreaterThan(
    BatterStatus value, {
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> statusLessThan(
    BatterStatus value, {
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> statusBetween(
    BatterStatus lower,
    BatterStatus upper, {
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> threesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'threes',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> threesGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> threesLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> threesBetween(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> twosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twos',
        value: value,
      ));
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> twosGreaterThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> twosLessThan(
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

  QueryBuilder<Batter, Batter, QAfterFilterCondition> twosBetween(
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
}

extension BatterQueryObject on QueryBuilder<Batter, Batter, QFilterCondition> {}

extension BatterQueryLinks on QueryBuilder<Batter, Batter, QFilterCondition> {
  QueryBuilder<Batter, Batter, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> match(
      FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<Batter, Batter, QAfterFilterCondition> matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }
}

extension BatterQuerySortBy on QueryBuilder<Batter, Batter, QSortBy> {
  QueryBuilder<Batter, Batter, QAfterSortBy> sortByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByBallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> sortByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }
}

extension BatterQuerySortThenBy on QueryBuilder<Batter, Batter, QSortThenBy> {
  QueryBuilder<Batter, Batter, QAfterSortBy> thenByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByBallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<Batter, Batter, QAfterSortBy> thenByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }
}

extension BatterQueryWhereDistinct on QueryBuilder<Batter, Batter, QDistinct> {
  QueryBuilder<Batter, Batter, QDistinct> distinctByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balls');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dots');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fours');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ones');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runs');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sixes');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'threes');
    });
  }

  QueryBuilder<Batter, Batter, QDistinct> distinctByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twos');
    });
  }
}

extension BatterQueryProperty on QueryBuilder<Batter, Batter, QQueryProperty> {
  QueryBuilder<Batter, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> ballsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balls');
    });
  }

  QueryBuilder<Batter, DateTime, QQueryOperations> dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> dotsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dots');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> foursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fours');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> onesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ones');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> runsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runs');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> sixesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sixes');
    });
  }

  QueryBuilder<Batter, BatterStatus, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> threesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'threes');
    });
  }

  QueryBuilder<Batter, int, QQueryOperations> twosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twos');
    });
  }
}
