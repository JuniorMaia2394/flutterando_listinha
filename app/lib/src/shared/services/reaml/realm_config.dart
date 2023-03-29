import 'package:listinha/src/shared/services/reaml/models/configuration_model.dart';
import 'package:listinha/src/shared/services/reaml/models/task_model.dart';
import 'package:realm/realm.dart';

LocalConfiguration config = Configuration.local(
  [
    ConfigurationModel.schema,
    Task.schema,
    TaskBoard.schema,
  ],
  initialDataCallback: (realm) {
    realm.add(ConfigurationModel('system'));
  },
  path: './realm/realm.db',
);
