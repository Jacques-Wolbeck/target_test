import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:target_test/shared/stores/home_store.dart';

class HomeStoreTest extends Mock implements SharedPreferences {}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  test('setText should update the text property', () {
    final store = HomeStore();

    store.setText('Hello, world!');
    expect(store.text, 'Hello, world!');
  });

  test('loadData should load the list from shared preferences', () async {
    final homeStoreTest = HomeStoreTest();
    final store = HomeStore();

    SharedPreferences.setMockInitialValues({});
    store.text = 'Hello, world!';
    store.addText();
    when(homeStoreTest.getStringList('texts')).thenReturn(['Hello, world!']);

    await store.loadData();

    expect(store.textsList, ['Hello, world!']);
  });
}
