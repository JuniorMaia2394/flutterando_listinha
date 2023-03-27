import 'package:flutter/material.dart';
import 'package:listinha/configuration/services/configuration_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);
  final ConfigurationService _configuratioService;

  AppStore(this._configuratioService) {
    init();
  }
  void init() {
    final model = _configuratioService.getConfiguration();
    syncDate.value = model.syncDate;
    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  void save() {
    _configuratioService.saveConfiguration(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void changeThemeMode(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  void deleteApp() {
    _configuratioService.deleteAll();
  }
}

ThemeMode _getThemeModeByName(String name) {
  return ThemeMode.values.firstWhere((mode) => mode.name == name);
}
