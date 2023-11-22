import 'package:flutter/material.dart';
import 'package:target_test/shared/stores/home_store.dart';
import 'package:target_test/views/widgets/alerts/default_alert.dart';
import 'package:target_test/views/widgets/alerts/edit_alert.dart';

class TextCards extends StatelessWidget {
  final HomeStore store;
  final String text;
  final int index;
  const TextCards({
    super.key,
    required this.store,
    required this.text,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Material(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8.0),
        child: ListTile(
          contentPadding: const EdgeInsets.all(4.0),
          title: Text(
            text,
            textAlign: TextAlign.center,
            softWrap: true,
          ),
          trailing: SizedBox(
            width: 100.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  tooltip: 'Editar',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return EditAlert(
                              intialValue: text,
                              onChanged: (value) => store.setText(value),
                              onSaved: () => store.edit(index));
                        });
                  },
                  icon: const Icon(
                    Icons.border_color,
                  ),
                ),
                IconButton(
                  tooltip: 'Deletar',
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return DefaultAlert(
                              title: 'Deseja deletar este item?',
                              button1Text: 'Sim',
                              onPressed: () {
                                store.delete(index);
                                Navigator.pop(context);
                              },
                              button2Text: 'Não');
                        });
                  },
                  icon: Icon(
                    Icons.cancel,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
