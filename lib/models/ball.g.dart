// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ball.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBallCollection on Isar {
  IsarCollection<Ball> get balls => this.collection();
}

const BallSchema = CollectionSchema(
  name: r'Ball',
  id: -1292384951720714968,
  properties: {
    r'ball': PropertySchema(
      id: 0,
      name: r'ball',
      type: IsarType.long,
    ),
    r'ballType': PropertySchema(
      id: 1,
      name: r'ballType',
      type: IsarType.byte,
      enumMap: _BallballTypeEnumValueMap,
    ),
    r'content': PropertySchema(
      id: 2,
      name: r'content',
      type: IsarType.string,
    ),
    r'datetime': PropertySchema(
      id: 3,
      name: r'datetime',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 4,
      name: r'name',
      type: IsarType.string,
    ),
    r'over': PropertySchema(
      id: 5,
      name: r'over',
      type: IsarType.long,
    )
  },
  estimateSize: _ballEstimateSize,
  serialize: _ballSerialize,
  deserialize: _ballDeserialize,
  deserializeProp: _ballDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'player': LinkSchema(
      id: 2896652806548648760,
      name: r'player',
      target: r'Player',
      single: true,
    ),
    r'match': LinkSchema(
      id: 2416955156036475131,
      name: r'match',
      target: r'Match',
      single: true,
    ),
    r'score': LinkSchema(
      id: 3857592244067700110,
      name: r'score',
      target: r'Score',
      single: true,
      linkName: r'ball',
    )
  },
  embeddedSchemas: {},
  getId: _ballGetId,
  getLinks: _ballGetLinks,
  attach: _ballAttach,
  version: '3.1.8',
);

int _ballEstimateSize(
  Ball object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _ballSerialize(
  Ball object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.ball);
  writer.writeByte(offsets[1], object.ballType.index);
  writer.writeString(offsets[2], object.content);
  writer.writeDateTime(offsets[3], object.datetime);
  writer.writeString(offsets[4], object.name);
  writer.writeLong(offsets[5], object.over);
}

Ball _ballDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Ball();
  object.ball = reader.readLong(offsets[0]);
  object.ballType =
      _BallballTypeValueEnumMap[reader.readByteOrNull(offsets[1])] ??
          BallType.runs;
  object.content = reader.readString(offsets[2]);
  object.datetime = reader.readDateTime(offsets[3]);
  object.id = id;
  object.name = reader.readString(offsets[4]);
  object.over = reader.readLong(offsets[5]);
  return object;
}

P _ballDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (_BallballTypeValueEnumMap[reader.readByteOrNull(offset)] ??
          BallType.runs) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _BallballTypeEnumValueMap = {
  'runs': 0,
  'four': 1,
  'six': 2,
  'wide': 3,
  'noball': 4,
  'noballLegbye': 5,
  'noballBye': 6,
  'wicket': 7,
  'bye': 8,
  'legbye': 9,
};
const _BallballTypeValueEnumMap = {
  0: BallType.runs,
  1: BallType.four,
  2: BallType.six,
  3: BallType.wide,
  4: BallType.noball,
  5: BallType.noballLegbye,
  6: BallType.noballBye,
  7: BallType.wicket,
  8: BallType.bye,
  9: BallType.legbye,
};

Id _ballGetId(Ball object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _ballGetLinks(Ball object) {
  return [object.player, object.match, object.score];
}

void _ballAttach(IsarCollection<dynamic> col, Id id, Ball object) {
  object.id = id;
  object.player.attach(col, col.isar.collection<Player>(), r'player', id);
  object.match.attach(col, col.isar.collection<Match>(), r'match', id);
  object.score.attach(col, col.isar.collection<Score>(), r'score', id);
}

extension BallQueryWhereSort on QueryBuilder<Ball, Ball, QWhere> {
  QueryBuilder<Ball, Ball, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BallQueryWhere on QueryBuilder<Ball, Ball, QWhereClause> {
  QueryBuilder<Ball, Ball, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Ball, Ball, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Ball, Ball, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Ball, Ball, QAfterWhereClause> idBetween(
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

extension BallQueryFilter on QueryBuilder<Ball, Ball, QFilterCondition> {
  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ball',
        value: value,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballGreaterThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballLessThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballBetween(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballTypeEqualTo(
      BallType value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ballType',
        value: value,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballTypeGreaterThan(
    BallType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ballType',
        value: value,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballTypeLessThan(
    BallType value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ballType',
        value: value,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> ballTypeBetween(
    BallType lower,
    BallType upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ballType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> datetimeEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'datetime',
        value: value,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> datetimeGreaterThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> datetimeLessThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> datetimeBetween(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> overEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'over',
        value: value,
      ));
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> overGreaterThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> overLessThan(
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

  QueryBuilder<Ball, Ball, QAfterFilterCondition> overBetween(
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
}

extension BallQueryObject on QueryBuilder<Ball, Ball, QFilterCondition> {}

extension BallQueryLinks on QueryBuilder<Ball, Ball, QFilterCondition> {
  QueryBuilder<Ball, Ball, QAfterFilterCondition> player(
      FilterQuery<Player> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'player');
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> playerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'player', 0, true, 0, true);
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> match(FilterQuery<Match> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'match');
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> matchIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'match', 0, true, 0, true);
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> score(FilterQuery<Score> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'score');
    });
  }

  QueryBuilder<Ball, Ball, QAfterFilterCondition> scoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'score', 0, true, 0, true);
    });
  }
}

extension BallQuerySortBy on QueryBuilder<Ball, Ball, QSortBy> {
  QueryBuilder<Ball, Ball, QAfterSortBy> sortByBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByBallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByBallType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballType', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByBallTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballType', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> sortByOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.desc);
    });
  }
}

extension BallQuerySortThenBy on QueryBuilder<Ball, Ball, QSortThenBy> {
  QueryBuilder<Ball, Ball, QAfterSortBy> thenByBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByBallDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ball', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByBallType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballType', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByBallTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ballType', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByDatetimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'datetime', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.asc);
    });
  }

  QueryBuilder<Ball, Ball, QAfterSortBy> thenByOverDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'over', Sort.desc);
    });
  }
}

extension BallQueryWhereDistinct on QueryBuilder<Ball, Ball, QDistinct> {
  QueryBuilder<Ball, Ball, QDistinct> distinctByBall() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ball');
    });
  }

  QueryBuilder<Ball, Ball, QDistinct> distinctByBallType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ballType');
    });
  }

  QueryBuilder<Ball, Ball, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ball, Ball, QDistinct> distinctByDatetime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'datetime');
    });
  }

  QueryBuilder<Ball, Ball, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Ball, Ball, QDistinct> distinctByOver() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'over');
    });
  }
}

extension BallQueryProperty on QueryBuilder<Ball, Ball, QQueryProperty> {
  QueryBuilder<Ball, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Ball, int, QQueryOperations> ballProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ball');
    });
  }

  QueryBuilder<Ball, BallType, QQueryOperations> ballTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ballType');
    });
  }

  QueryBuilder<Ball, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<Ball, DateTime, QQueryOperations> datetimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'datetime');
    });
  }

  QueryBuilder<Ball, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Ball, int, QQueryOperations> overProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'over');
    });
  }
}
