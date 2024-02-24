// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leiloes_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LeiloesStore on _LeiloesStoreBase, Store {
  late final _$stateAtom =
      Atom(name: '_LeiloesStoreBase.state', context: context);

  @override
  LeiloesState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LeiloesState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getLeiloesAsyncAction =
      AsyncAction('_LeiloesStoreBase.getLeiloes', context: context);

  @override
  Future<dynamic> getLeiloes() {
    return _$getLeiloesAsyncAction.run(() => super.getLeiloes());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
