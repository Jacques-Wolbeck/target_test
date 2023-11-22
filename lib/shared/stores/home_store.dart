import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  String text = '';
  @observable
  List<String> textsList = [];

  @action
  void setText(String txt) {
    text = txt;
  }

  @action
  Future<void> addText() async {
    textsList.add(text);
    await _save();
    await loadData();
  }

  @action
  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    textsList = prefs.getStringList('texts') ?? [];
  }

  @action
  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('texts', textsList);
  }

  @action
  Future<void> delete(int index) async {
    textsList.removeAt(index);
    await _save();
    await loadData();
  }

  @action
  Future<void> edit(int index) async {
    textsList[index] = text;
    await _save();
    await loadData();
  }
}
