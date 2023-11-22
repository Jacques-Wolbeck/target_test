// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$textAtom = Atom(name: '_HomeStore.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$textsListAtom =
      Atom(name: '_HomeStore.textsList', context: context);

  @override
  List<String> get textsList {
    _$textsListAtom.reportRead();
    return super.textsList;
  }

  @override
  set textsList(List<String> value) {
    _$textsListAtom.reportWrite(value, super.textsList, () {
      super.textsList = value;
    });
  }

  late final _$addTextAsyncAction =
      AsyncAction('_HomeStore.addText', context: context);

  @override
  Future<void> addText() {
    return _$addTextAsyncAction.run(() => super.addText());
  }

  late final _$loadDataAsyncAction =
      AsyncAction('_HomeStore.loadData', context: context);

  @override
  Future<void> loadData() {
    return _$loadDataAsyncAction.run(() => super.loadData());
  }

  late final _$_saveAsyncAction =
      AsyncAction('_HomeStore._save', context: context);

  @override
  Future<void> _save() {
    return _$_saveAsyncAction.run(() => super._save());
  }

  late final _$deleteAsyncAction =
      AsyncAction('_HomeStore.delete', context: context);

  @override
  Future<void> delete(int index) {
    return _$deleteAsyncAction.run(() => super.delete(index));
  }

  late final _$editAsyncAction =
      AsyncAction('_HomeStore.edit', context: context);

  @override
  Future<void> edit(int index) {
    return _$editAsyncAction.run(() => super.edit(index));
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setText(String txt) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setText');
    try {
      return super.setText(txt);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
text: ${text},
textsList: ${textsList}
    ''';
  }
}
