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
    r'runs': PropertySchema(
      id: 1,
      name: r'runs',
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
  writer.writeLong(offsets[1], object.runs);
}

PartnershipInfo _partnershipInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PartnershipInfo();
  object.balls = reader.readLong(offsets[0]);
  object.id = id;
  object.runs = reader.readLong(offsets[1]);
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
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _partnershipInfoGetId(PartnershipInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _partnershipInfoGetLinks(PartnershipInfo object) {
  return [object.partnership];
}

void _partnershipInfoAttach(
    IsarCollection<dynamic> col, Id id, PartnershipInfo object) {
  object.id = id;
  object.partnership
      .attach(col, col.isar.collection<Partnership>(), r'partnership', id);
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
}

extension PartnershipInfoQueryWhereDistinct
    on QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> {
  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByBalls() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'balls');
    });
  }

  QueryBuilder<PartnershipInfo, PartnershipInfo, QDistinct> distinctByRuns() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'runs');
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

  QueryBuilder<PartnershipInfo, int, QQueryOperations> runsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'runs');
    });
  }
}
