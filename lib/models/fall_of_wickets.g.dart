// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fall_of_wickets.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFallOfWicketsCollection on Isar {
  IsarCollection<FallOfWickets> get fallOfWickets => this.collection();
}

const FallOfWicketsSchema = CollectionSchema(
  name: r'FallOfWickets',
  id: 2371410116932638531,
  properties: {
    r'ball': PropertySchema(
      id: 0,
      name: r'ball',
      type: IsarType.long,
    ),
    r'datetime': PropertySchema(
      id: 1,
      name: r'datetime',
      type: IsarType.dateTime,
    ),
    r'over': PropertySchema(
      id: 2,
      name: r'over',
      type: IsarType.long,
    ),
    r'run': PropertySchema(
      id: 3,
      name: r'run',
      type: IsarType.long,
    )
  },
  estimateSize: _fallOfWicketsEstimateSize,
  serialize: _fallOfWicketsSerialize,
  deserialize: _fallOfWicketsDeserialize,
  deserializeProp: _fallOfWicketsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'player': LinkSchema(
      id: -8524704145948024268,
      name: r'player',
      target: r'Player',
      single: true,
    ),
    r'match': LinkSchema(
      id: 8728776788399965929,
      name: r'match',
      target: r'Match',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _fallOfWicketsGetId,
  getLinks: _fallOfWicketsGetLinks,
  attach: _fallOfWicketsAttach,
  version: '3.1.8',
);

int _fallOfWicketsEstimateSize(
  FallOfWickets object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _fallOfWicketsSerialize(
  FallOfWickets object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ball);
  writer.writeDateTime(offsets[1], object.datetime);
  writer.writeLong(offsets[2], object.over);
  writer.writeLong(offsets[3], object.run);
}

FallOfWickets _fallOfWicketsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FallOfWickets(
    ball: reader.readLong(offsets[0]),
    over: reader.readLong(offsets[2]),
    run: reader.readLong(offsets[3]),
  );
  object.id = id;
  return object;
}

P _fallOfWicketsDeserializeProp<P>(
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
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _fallOfWicketsGetId(FallOfWickets object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _fallOfWicketsGetLinks(FallOfWickets object) {
  return [object.player, object.match];
}

void _fallOfWicketsAttach(
    IsarCollection<dynamic> col, Id id, FallOfWickets object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
}

extension FallOfWicketsQueryWhereSort
    on QueryBuilder<FallOfWickets, FallOfWickets, QWhere> {
  QueryBuilder<FallOfWickets, FallOfWickets, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FallOfWicketsQueryWhere
    on QueryBuilder<FallOfWickets, FallOfWickets, QWhereClause> {
  QueryBuilder<FallOfWickets, FallOfWickets, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterWhereClause> idBetween(
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

extension FallOfWicketsQueryFilter
    on QueryBuilder<FallOfWickets, FallOfWickets, QFilterCondition> {
  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> ballEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ball',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      ballGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ball',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      ballLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ball',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> ballBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ball',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      datetimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
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

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
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

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
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

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
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

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> idBetween(
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

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> overEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'over',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      overGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'over',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      overLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'over',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> overBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'over',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> runEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'run',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      runGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'run',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> runLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'run',
        value: value,
      ));
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> runBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'run',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FallOfWicketsQueryObject
    on QueryBuilder<FallOfWickets, FallOfWickets, QFilterCondition> {}

extension FallOfWicketsQueryLinks
    on QueryBuilder<FallOfWickets, FallOfWickets, QFilterCondition> {
  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition> match(
      FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterFilterCondition>
      matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }
}

extension FallOfWicketsQuerySortBy
    on QueryBuilder<FallOfWickets, FallOfWickets, QSortBy> {
  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> sortByBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> sortByBallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.desc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> sortByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy>
      sortByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> sortByOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> sortByOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.desc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> sortByRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'run', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> sortByRunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'run', Sort.desc);
    });
  }
}

extension FallOfWicketsQuerySortThenBy
    on QueryBuilder<FallOfWickets, FallOfWickets, QSortThenBy> {
  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByBallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.desc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy>
      thenByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.desc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'run', Sort.asc);
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QAfterSortBy> thenByRunDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'run', Sort.desc);
    });
  }
}

extension FallOfWicketsQueryWhereDistinct
    on QueryBuilder<FallOfWickets, FallOfWickets, QDistinct> {
  QueryBuilder<FallOfWickets, FallOfWickets, QDistinct> distinctByBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ball');
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QDistinct> distinctByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datetime');
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QDistinct> distinctByOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'over');
    });
  }

  QueryBuilder<FallOfWickets, FallOfWickets, QDistinct> distinctByRun() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'run');
    });
  }
}

extension FallOfWicketsQueryProperty
    on QueryBuilder<FallOfWickets, FallOfWickets, QQueryProperty> {
  QueryBuilder<FallOfWickets, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FallOfWickets, int, QQueryOperations> ballProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ball');
    });
  }

  QueryBuilder<FallOfWickets, DateTime, QQueryOperations> datetimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datetime');
    });
  }

  QueryBuilder<FallOfWickets, int, QQueryOperations> overProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'over');
    });
  }

  QueryBuilder<FallOfWickets, int, QQueryOperations> runProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'run');
    });
  }
}
