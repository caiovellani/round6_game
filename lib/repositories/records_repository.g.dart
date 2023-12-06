// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'records_repository.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecordsRepository on RecordsRepositoryBase, Store {
  late final _$recordsRound6Atom =
      Atom(name: 'RecordsRepositoryBase.recordsRound6', context: context);

  @override
  Map<dynamic, dynamic> get recordsRound6 {
    _$recordsRound6Atom.reportRead();
    return super.recordsRound6;
  }

  @override
  set recordsRound6(Map<dynamic, dynamic> value) {
    _$recordsRound6Atom.reportWrite(value, super.recordsRound6, () {
      super.recordsRound6 = value;
    });
  }

  late final _$recordsNormalAtom =
      Atom(name: 'RecordsRepositoryBase.recordsNormal', context: context);

  @override
  Map<dynamic, dynamic> get recordsNormal {
    _$recordsNormalAtom.reportRead();
    return super.recordsNormal;
  }

  @override
  set recordsNormal(Map<dynamic, dynamic> value) {
    _$recordsNormalAtom.reportWrite(value, super.recordsNormal, () {
      super.recordsNormal = value;
    });
  }

  late final _$RecordsRepositoryBaseActionController =
      ActionController(name: 'RecordsRepositoryBase', context: context);

  @override
  dynamic loadRecordes() {
    final _$actionInfo = _$RecordsRepositoryBaseActionController.startAction(
        name: 'RecordsRepositoryBase.loadRecordes');
    try {
      return super.loadRecordes();
    } finally {
      _$RecordsRepositoryBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recordsRound6: ${recordsRound6},
recordsNormal: ${recordsNormal}
    ''';
  }
}
