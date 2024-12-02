// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partnership.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPartnershipCollection on Isar {
  IsarCollection<Partnership> get partnerships => this.collection();
}

const PartnershipSchema = CollectionSchema(
  name: r'Partnership',
  id: -1110866495211261340,
  properties: {
    r'partnershipOrder': PropertySchema(
      id: 0,
      name: r'partnershipOrder',
      type: IsarType.long,
    )
  },
  estimateSize: _partnershipEstimateSize,
  serialize: _partnershipSerialize,
  deserialize: _partnershipDeserialize,
  deserializeProp: _partnershipDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'playersInPartnership': LinkSchema(
      id: -7013727321133380282,
      name: r'playersInPartnership',
      target: r'Player',
      single: false,
    ),
    r'match': LinkSchema(
      id: 4323551193195541281,
      name: r'match',
      target: r'Match',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _partnershipGetId,
  getLinks: _partnershipGetLinks,
  attach: _partnershipAttach,
  version: '3.1.8',
);

int _partnershipEstimateSize(
  Partnership object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _partnershipSerialize(
  Partnership object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.partnershipOrder);
}

Partnership _partnershipDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Partnership(
    partnershipOrder: reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _partnershipDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _partnershipGetId(Partnership object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _partnershipGetLinks(Partnership object) {
  return [object.playersInPartnership, object.match];
}

void _partnershipAttach(
    IsarCollection<dynamic> col, Id id, Partnership object) {
  object.id = id;
  object.playersInPartnership
      .attach(col, col.isar.collection<Player>(), r'playersInPartnership', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
}

extension PartnershipQueryWhereSort
    on QueryBuilder<Partnership, Partnership, QWhere> {
  QueryBuilder<Partnership, Partnership, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PartnershipQueryWhere
    on QueryBuilder<Partnership, Partnership, QWhereClause> {
  QueryBuilder<Partnership, Partnership, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<Partnership, Partnership, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterWhereClause> idBetween(
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

extension PartnershipQueryFilter
    on QueryBuilder<Partnership, Partnership, QFilterCondition> {
  QueryBuilder<Partnership, Partnership, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      partnershipOrderEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'partnershipOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      partnershipOrderGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'partnershipOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      partnershipOrderLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'partnershipOrder',
        value: value,
      ));
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      partnershipOrderBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'partnershipOrder',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PartnershipQueryObject
    on QueryBuilder<Partnership, Partnership, QFilterCondition> {}

extension PartnershipQueryLinks
    on QueryBuilder<Partnership, Partnership, QFilterCondition> {
  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      playersInPartnership(FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'playersInPartnership');
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      playersInPartnershipLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'playersInPartnership', length, true, length, true);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      playersInPartnershipIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playersInPartnership', 0, true, 0, true);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      playersInPartnershipIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'playersInPartnership', 0, false, 999999, true);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      playersInPartnershipLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'playersInPartnership', 0, true, length, include);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      playersInPartnershipLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'playersInPartnership', length, include, 999999, true);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition>
      playersInPartnershipLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'playersInPartnership', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition> match(
      FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterFilterCondition> matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }
}

extension PartnershipQuerySortBy
    on QueryBuilder<Partnership, Partnership, QSortBy> {
  QueryBuilder<Partnership, Partnership, QAfterSortBy>
      sortByPartnershipOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnershipOrder', Sort.asc);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterSortBy>
      sortByPartnershipOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnershipOrder', Sort.desc);
    });
  }
}

extension PartnershipQuerySortThenBy
    on QueryBuilder<Partnership, Partnership, QSortThenBy> {
  QueryBuilder<Partnership, Partnership, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterSortBy>
      thenByPartnershipOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnershipOrder', Sort.asc);
    });
  }

  QueryBuilder<Partnership, Partnership, QAfterSortBy>
      thenByPartnershipOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'partnershipOrder', Sort.desc);
    });
  }
}

extension PartnershipQueryWhereDistinct
    on QueryBuilder<Partnership, Partnership, QDistinct> {
  QueryBuilder<Partnership, Partnership, QDistinct>
      distinctByPartnershipOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'partnershipOrder');
    });
  }
}

extension PartnershipQueryProperty
    on QueryBuilder<Partnership, Partnership, QQueryProperty> {
  QueryBuilder<Partnership, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Partnership, int, QQueryOperations> partnershipOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'partnershipOrder');
    });
  }
}
