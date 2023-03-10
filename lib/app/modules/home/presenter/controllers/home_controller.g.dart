// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$currentSessionAtom =
      Atom(name: 'HomeControllerBase.currentSession', context: context);

  @override
  int get currentSession {
    _$currentSessionAtom.reportRead();
    return super.currentSession;
  }

  @override
  set currentSession(int value) {
    _$currentSessionAtom.reportWrite(value, super.currentSession, () {
      super.currentSession = value;
    });
  }

  late final _$isScrollingAtom =
      Atom(name: 'HomeControllerBase.isScrolling', context: context);

  @override
  bool get isScrolling {
    _$isScrollingAtom.reportRead();
    return super.isScrolling;
  }

  @override
  set isScrolling(bool value) {
    _$isScrollingAtom.reportWrite(value, super.isScrolling, () {
      super.isScrolling = value;
    });
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  void setCurrentSession(int value) {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.setCurrentSession');
    try {
      return super.setCurrentSession(value);
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentSession: ${currentSession},
isScrolling: ${isScrolling}
    ''';
  }
}
