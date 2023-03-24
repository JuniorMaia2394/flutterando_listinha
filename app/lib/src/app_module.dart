import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha/configuration/configuration_page.dart';
import 'package:listinha/home/home_module.dart';
import 'package:listinha/home/home_page.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/home',
          module: HomeModule(),
        ),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
