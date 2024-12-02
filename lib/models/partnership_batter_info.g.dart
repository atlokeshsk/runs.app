// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership_batter_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPartnershipBatterInfoCollection on Isar {
  IsarCollection<PartnershipBatterInfo> get partnershipBatterInfos =>
      this.collection();
}

const PartnershipBatterInfoSchema = CollectionSchema(
  name: r'PartnershipBatterInfo',
  id: 6285819158029287683,
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
    r'threes': PropertySchema(
      id: 7,
      name: r'threes',
      type: IsarType.long,
    ),
    r'twos': PropertySchema(
      id: 8,
      name: r'twos',
      type: IsarType.long,
    )
  },
  estimateSize: _partnershipBatterInfoEstimateSize,
  serialize: _partnershipBatterInfoSerialize,
  deserialize: _partnershipBatterInfoDeserialize,
  deserializeProp: _partnershipBatterInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'player': LinkSchema(
      id: 1343345244505636268,
      name: r'player',
      target: r'Player',
      single: true,
    ),
    r'match': LinkSchema(
      id: 3508708303428725418,
      name: r'match',
      target: r'Match',
      single: true,
    ),
    r'partnership': LinkSchema(
      id: 5537877499669500813,
      name: r'partnership',
      target: r'Partnership',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _partnershipBatterInfoGetId,
  getLinks: _partnershipBatterInfoGetLinks,
  attach: _partnershipBatterInfoAttach,
  version: '3.1.8',
);

int _partnershipBatterInfoEstimateSize(
  PartnershipBatterInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _partnershipBatterInfoSerialize(
  PartnershipBatterInfo object,
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
  writer.writeLong(offsets[7], object.threes);
  writer.writeLong(offsets[8], object.twos);
}

PartnershipBatterInfo _partnershipBatterInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PartnershipBatterInfo();
  object.balls = reader.readLong(offsets[0]);
  object.dateTime = reader.readDateTime(offsets[1]);
  object.dots = reader.readLong(offsets[2]);
  object.fours = reader.readLong(offsets[3]);
  object.id = id;
  object.ones = reader.readLong(offsets[4]);
  object.runs = reader.readLong(offsets[5]);
  object.sixes = reader.readLong(offsets[6]);
  object.threes = reader.readLong(offsets[7]);
  object.twos = reader.readLong(offsets[8]);
  return object;
}

P _partnershipBatterInfoDeserializeProp<P>(
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
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _partnershipBatterInfoGetId(PartnershipBatterInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _partnershipBatterInfoGetLinks(
    PartnershipBatterInfo object) {
  return [object.player, object.match, object.partnership];
}

void _partnershipBatterInfoAttach(
    IsarCollection<dynamic> col, Id id, PartnershipBatterInfo object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
  object.partnership
      .attach(col, col.isar.collection<Partnership>(), r'partnership', id);
}

extension PartnershipBatterInfoQueryWhereSort
    on QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QWhere> {
  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PartnershipBatterInfoQueryWhere on QueryBuilder<PartnershipBatterInfo,
    PartnershipBatterInfo, QWhereClause> {
  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterWhereClause>
      idBetween(
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

extension PartnershipBatterInfoQueryFilter on QueryBuilder<
    PartnershipBatterInfo, PartnershipBatterInfo, QFilterCondition> {
  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> ballsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balls',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> ballsGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> ballsLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> ballsBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dateTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dateTime',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dateTimeGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dateTimeLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dateTimeBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dotsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dots',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dotsGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dotsLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> dotsBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> foursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fours',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> foursGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> foursLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> foursBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> onesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ones',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> onesGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> onesLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> onesBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> runsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'runs',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> runsGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> runsLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> runsBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> sixesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sixes',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> sixesGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> sixesLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> sixesBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> threesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'threes',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> threesGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> threesLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> threesBetween(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> twosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twos',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> twosGreaterThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> twosLessThan(
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

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> twosBetween(
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

extension PartnershipBatterInfoQueryObject on QueryBuilder<
    PartnershipBatterInfo, PartnershipBatterInfo, QFilterCondition> {}

extension PartnershipBatterInfoQueryLinks on QueryBuilder<PartnershipBatterInfo,
    PartnershipBatterInfo, QFilterCondition> {
  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> player(FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> match(FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> partnership(FilterQuery<Partnership> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'partnership');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo,
      QAfterFilterCondition> partnershipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'partnership', 0, true, 0, true);
    });
  }
}

extension PartnershipBatterInfoQuerySortBy
    on QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QSortBy> {
  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByBallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      sortByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }
}

extension PartnershipBatterInfoQuerySortThenBy
    on QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QSortThenBy> {
  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByBallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByDateTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dateTime', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QAfterSortBy>
      thenByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }
}

extension PartnershipBatterInfoQueryWhereDistinct
    on QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct> {
  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balls');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByDateTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dateTime');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dots');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fours');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ones');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runs');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sixes');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'threes');
    });
  }

  QueryBuilder<PartnershipBatterInfo, PartnershipBatterInfo, QDistinct>
      distinctByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twos');
    });
  }
}

extension PartnershipBatterInfoQueryProperty on QueryBuilder<
    PartnershipBatterInfo, PartnershipBatterInfo, QQueryProperty> {
  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> ballsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balls');
    });
  }

  QueryBuilder<PartnershipBatterInfo, DateTime, QQueryOperations>
      dateTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dateTime');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> dotsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dots');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> foursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fours');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> onesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ones');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> runsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runs');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> sixesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sixes');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> threesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'threes');
    });
  }

  QueryBuilder<PartnershipBatterInfo, int, QQueryOperations> twosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twos');
    });
  }
}
