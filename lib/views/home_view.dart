import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:target_test/shared/stores/home_store.dart';
import 'package:target_test/shared/utilis/url_lauchers.dart';
import 'package:target_test/views/widgets/home_widgets/home_text_field.dart';
import 'package:target_test/views/widgets/home_widgets/text_cards.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _formkey = GlobalKey<FormState>();
  final _store = HomeStore();
  final _currentFocus = FocusNode();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  _loadData() async {
    await _store.loadData();
  }

  @override
  void dispose() {
    _currentFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, .6),
          colors: <Color>[
            Theme.of(context).colorScheme.primary,
            Theme.of(context).colorScheme.secondary
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _body(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextButton(
            onPressed: () async => openUrl(),
            child: Text(
              'Politíca de Privacidade',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SafeArea(
      minimum: const EdgeInsets.all(32.0),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: BorderRadius.circular(8.0)),
                child: Observer(
                  builder: (_) {
                    return _store.textsList.isEmpty
                        ? const Center(child: Text('Não há textos.'))
                        : Scrollbar(
                            controller: _scrollController,
                            child: ListView.builder(
                              controller: _scrollController,
                              itemCount: _store.textsList.length,
                              itemBuilder: (context, index) {
                                return TextCards(
                                  store: _store,
                                  text: _store.textsList[index],
                                  index: index,
                                );
                              },
                            ),
                          );
                  },
                ),
              ),
            ),
            const SizedBox(height: 32.0),
            Flexible(
              flex: 3,
              child: Form(
                key: _formkey,
                child: HomeTextField(
                    formKey: _formkey,
                    onFieldSubmitted: _store.addText,
                    onChanged: (value) => _store.setText(value),
                    currentFocus: _currentFocus),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
