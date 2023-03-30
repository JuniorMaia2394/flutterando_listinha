import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  final appStore = Modular.get<AppStore>();

  void _changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      appStore.themeMode = mode;
    }
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => appStore.themeMode);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LISTINHA'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Tema',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.system,
              title: const Text('Sistema'),
              groupValue: appStore.themeMode, //pega o value selecionado
              onChanged: _changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.light,
              title: const Text('Claro'),
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
            ),
            RadioListTile<ThemeMode>(
              value: ThemeMode.dark,
              title: const Text('Escuro'),
              groupValue: appStore.themeMode,
              onChanged: _changeThemeMode,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Controle de dados',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {},
              child: const Text(
                'Apagar cache e reiniciar o app',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
