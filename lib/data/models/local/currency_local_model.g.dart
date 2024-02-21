// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_local_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCurrencyLocalModelCollection on Isar {
  IsarCollection<CurrencyLocalModel> get currencyLocalModels =>
      this.collection();
}

const CurrencyLocalModelSchema = CollectionSchema(
  name: r'CurrencyLocalModel',
  id: 1993533162168167444,
  properties: {
    r'currencies': PropertySchema(
      id: 0,
      name: r'currencies',
      type: IsarType.string,
    )
  },
  estimateSize: _currencyLocalModelEstimateSize,
  serialize: _currencyLocalModelSerialize,
  deserialize: _currencyLocalModelDeserialize,
  deserializeProp: _currencyLocalModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _currencyLocalModelGetId,
  getLinks: _currencyLocalModelGetLinks,
  attach: _currencyLocalModelAttach,
  version: '3.1.0+1',
);

int _currencyLocalModelEstimateSize(
  CurrencyLocalModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.currencies;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _currencyLocalModelSerialize(
  CurrencyLocalModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.currencies);
}

CurrencyLocalModel _currencyLocalModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CurrencyLocalModel();
  object.currencies = reader.readStringOrNull(offsets[0]);
  object.id = id;
  return object;
}

P _currencyLocalModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _currencyLocalModelGetId(CurrencyLocalModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _currencyLocalModelGetLinks(
    CurrencyLocalModel object) {
  return [];
}

void _currencyLocalModelAttach(
    IsarCollection<dynamic> col, Id id, CurrencyLocalModel object) {
  object.id = id;
}

extension CurrencyLocalModelQueryWhereSort
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QWhere> {
  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CurrencyLocalModelQueryWhere
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QWhereClause> {
  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterWhereClause>
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

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterWhereClause>
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

extension CurrencyLocalModelQueryFilter
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QFilterCondition> {
  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'currencies',
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'currencies',
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currencies',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'currencies',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'currencies',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currencies',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      currenciesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'currencies',
        value: '',
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
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

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
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

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterFilterCondition>
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
}

extension CurrencyLocalModelQueryObject
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QFilterCondition> {}

extension CurrencyLocalModelQueryLinks
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QFilterCondition> {}

extension CurrencyLocalModelQuerySortBy
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QSortBy> {
  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterSortBy>
      sortByCurrencies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencies', Sort.asc);
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterSortBy>
      sortByCurrenciesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencies', Sort.desc);
    });
  }
}

extension CurrencyLocalModelQuerySortThenBy
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QSortThenBy> {
  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterSortBy>
      thenByCurrencies() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencies', Sort.asc);
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterSortBy>
      thenByCurrenciesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currencies', Sort.desc);
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CurrencyLocalModelQueryWhereDistinct
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QDistinct> {
  QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QDistinct>
      distinctByCurrencies({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currencies', caseSensitive: caseSensitive);
    });
  }
}

extension CurrencyLocalModelQueryProperty
    on QueryBuilder<CurrencyLocalModel, CurrencyLocalModel, QQueryProperty> {
  QueryBuilder<CurrencyLocalModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CurrencyLocalModel, String?, QQueryOperations>
      currenciesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currencies');
    });
  }
}
