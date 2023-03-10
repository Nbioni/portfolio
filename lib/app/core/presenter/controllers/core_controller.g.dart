// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CoreController on CoreControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: 'CoreControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$CoreControllerBaseActionController =
      ActionController(name: 'CoreControllerBase', context: context);

  @override
  void setLoading(bool isLoading) {
    final _$actionInfo = _$CoreControllerBaseActionController.startAction(
        name: 'CoreControllerBase.setLoading');
    try {
      return super.setLoading(isLoading);
    } finally {
      _$CoreControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
