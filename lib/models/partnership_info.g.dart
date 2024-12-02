// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership_info.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPartnershipInfoCollection on Isar {
  IsarCollection<PartnershipInfo> get partnershipInfos => this.collection();
}

const PartnershipInfoSchema = CollectionSchema(
  name: r'PartnershipInfo',
  id: -2666110455716905349,
  properties: {
    r'balls': PropertySchema(
      id: 0,
      name: r'balls',
      type: IsarType.long,
    ),
    r'datetime': PropertySchema(
      id: 1,
      name: r'datetime',
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
  estimateSize: _partnershipInfoEstimateSize,
  serialize: _partnershipInfoSerialize,
  deserialize: _partnershipInfoDeserialize,
  deserializeProp: _partnershipInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'partnership': LinkSchema(
      id: 5825737346428865991,
      name: r'partnership',
      target: r'Partnership',
      single: true,
    ),
    r'match': LinkSchema(
      id: -4907959058039041540,
      name: r'match',
      target: r'Match',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _partnershipInfoGetId,
  getLinks: _partnershipInfoGetLinks,
  attach: _partnershipInfoAttach,
  version: '3.1.8',
);

int _partnershipInfoEstimateSize(
  PartnershipInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _partnershipInfoSerialize(
  PartnershipInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.balls);
  writer.writeDateTime(offsets[1], object.datetime);
  writer.writeLong(offsets[2], object.dots);
  writer.writeLong(offsets[3], object.fours);
  writer.writeLong(offsets[4], object.ones);
  writer.writeLong(offsets[5], object.runs);
  writer.writeLong(offsets[6], object.sixes);
  writer.writeLong(offsets[7], object.threes);
  writer.writeLong(offsets[8], object.twos);
}

PartnershipInfo _partnershipInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PartnershipInfo();
  object.balls = reader.readLong(offsets[0]);
  object.datetime = reader.readDateTime(offsets[1]);
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

P _partnershipInfoDeserializeProp<P>(
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

Id _partnershipInfoGetId(PartnershipInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _partnershipInfoGetLinks(PartnershipInfo object) {
  return [object.partnership, object.match];
}

void _partnershipInfoAttach(
    IsarCollection<dynamic> col, Id id, PartnershipInfo object) {
  object.id = id;
  object.partnership
      .attach(col, col.isar.collection<Partnership>(), r'partnership', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
}

extension PartnershipInfoQueryWhereSort
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QWhere> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PartnershipInfoQueryWhere
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QWhereClause> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterWhereClause>
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterWhereClause> idBetween(
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

extension PartnershipInfoQueryFilter
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QFilterCondition> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      ballsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'balls',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      ballsGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      ballsLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      ballsBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      datetimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      datetimeGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      datetimeLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      datetimeBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      dotsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dots',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      dotsGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      dotsLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      dotsBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      foursEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fours',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      foursGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      foursLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      foursBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      onesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ones',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      onesGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      onesLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      onesBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      runsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'runs',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      runsGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      runsLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      runsBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      sixesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sixes',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      sixesGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      sixesLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      sixesBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      threesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'threes',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      threesGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      threesLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      threesBetween(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      twosEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'twos',
        value: value,
      ));
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      twosGreaterThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      twosLessThan(
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

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      twosBetween(
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

extension PartnershipInfoQueryObject
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QFilterCondition> {}

extension PartnershipInfoQueryLinks
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QFilterCondition> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      partnership(FilterQuery<Partnership> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'partnership');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      partnershipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'partnership', 0, true, 0, true);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition> match(
      FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterFilterCondition>
      matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }
}

extension PartnershipInfoQuerySortBy
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QSortBy> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByBallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> sortByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      sortByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }
}

extension PartnershipInfoQuerySortThenBy
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QSortThenBy> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByBallsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'balls', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByDotsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dots', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByFoursDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fours', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByOnesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ones', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByRunsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'runs', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenBySixesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sixes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByThreesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'threes', Sort.desc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy> thenByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.asc);
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QAfterSortBy>
      thenByTwosDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'twos', Sort.desc);
    });
  }
}

extension PartnershipInfoQueryWhereDistinct
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balls');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct>
      distinctByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datetime');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByDots() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dots');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByFours() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fours');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByOnes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ones');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runs');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctBySixes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sixes');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByThrees() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'threes');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByTwos() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'twos');
    });
  }
}

extension PartnershipInfoQueryProperty
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QQueryProperty> {
  QueryBuilder<PartnershipInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> ballsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'balls');
    });
  }

  QueryBuilder<PartnershipInfo, DateTime, QQueryOperations> datetimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datetime');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> dotsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dots');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> foursProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fours');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> onesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ones');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> runsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runs');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> sixesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sixes');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> threesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'threes');
    });
  }

  QueryBuilder<PartnershipInfo, int, QQueryOperations> twosProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'twos');
    });
  }
}
