// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scoreboard.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetScoreBoardCollection on Isar {
  IsarCollection<ScoreBoard> get scoreBoards => this.collection();
}

const ScoreBoardSchema = CollectionSchema(
  name: r'ScoreBoard',
  id: 3508392355037056937,
  properties: {
    r'position': PropertySchema(
      id: 0,
      name: r'position',
      type: IsarType.long,
    )
  },
  estimateSize: _scoreBoardEstimateSize,
  serialize: _scoreBoardSerialize,
  deserialize: _scoreBoardDeserialize,
  deserializeProp: _scoreBoardDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'player': LinkSchema(
      id: -1056228171286986931,
      name: r'player',
      target: r'Player',
      single: true,
    ),
    r'match': LinkSchema(
      id: 5227554711622221592,
      name: r'match',
      target: r'Match',
      single: true,
    ),
    r'score': LinkSchema(
      id: -4655852713621180948,
      name: r'score',
      target: r'Score',
      single: true,
      linkName: r'socreboard',
    )
  },
  embeddedSchemas: {},
  getId: _scoreBoardGetId,
  getLinks: _scoreBoardGetLinks,
  attach: _scoreBoardAttach,
  version: '3.1.8',
);

int _scoreBoardEstimateSize(
  ScoreBoard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _scoreBoardSerialize(
  ScoreBoard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.position);
}

ScoreBoard _scoreBoardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ScoreBoard(
    position: reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _scoreBoardDeserializeProp<P>(
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

Id _scoreBoardGetId(ScoreBoard object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _scoreBoardGetLinks(ScoreBoard object) {
  return [object.player, object.match, object.score];
}

void _scoreBoardAttach(IsarCollection<dynamic> col, Id id, ScoreBoard object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
  object.score.attach(col, col.isar.collection<Score>(), r'score', id);
}

extension ScoreBoardQueryWhereSort
    on QueryBuilder<ScoreBoard, ScoreBoard, QWhere> {
  QueryBuilder<ScoreBoard, ScoreBoard, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ScoreBoardQueryWhere
    on QueryBuilder<ScoreBoard, ScoreBoard, QWhereClause> {
  QueryBuilder<ScoreBoard, ScoreBoard, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterWhereClause> idBetween(
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

extension ScoreBoardQueryFilter
    on QueryBuilder<ScoreBoard, ScoreBoard, QFilterCondition> {
  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> positionEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition>
      positionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> positionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'position',
        value: value,
      ));
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> positionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'position',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ScoreBoardQueryObject
    on QueryBuilder<ScoreBoard, ScoreBoard, QFilterCondition> {}

extension ScoreBoardQueryLinks
    on QueryBuilder<ScoreBoard, ScoreBoard, QFilterCondition> {
  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> match(
      FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> score(
      FilterQuery<Score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'score');
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterFilterCondition> scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'score', 0, true, 0, true);
    });
  }
}

extension ScoreBoardQuerySortBy
    on QueryBuilder<ScoreBoard, ScoreBoard, QSortBy> {
  QueryBuilder<ScoreBoard, ScoreBoard, QAfterSortBy> sortByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterSortBy> sortByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }
}

extension ScoreBoardQuerySortThenBy
    on QueryBuilder<ScoreBoard, ScoreBoard, QSortThenBy> {
  QueryBuilder<ScoreBoard, ScoreBoard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterSortBy> thenByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.asc);
    });
  }

  QueryBuilder<ScoreBoard, ScoreBoard, QAfterSortBy> thenByPositionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'position', Sort.desc);
    });
  }
}

extension ScoreBoardQueryWhereDistinct
    on QueryBuilder<ScoreBoard, ScoreBoard, QDistinct> {
  QueryBuilder<ScoreBoard, ScoreBoard, QDistinct> distinctByPosition() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'position');
    });
  }
}

extension ScoreBoardQueryProperty
    on QueryBuilder<ScoreBoard, ScoreBoard, QQueryProperty> {
  QueryBuilder<ScoreBoard, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ScoreBoard, int, QQueryOperations> positionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'position');
    });
  }
}
