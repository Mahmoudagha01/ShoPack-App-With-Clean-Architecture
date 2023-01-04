import 'dart:io';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'local_theme/theme_hive.dart';

class ThemeDatabaseService {
  static dynamic themeBox;
  static Future<void> checkDatabaseExists() async {
    Directory themeDatabaseDir = await getApplicationSupportDirectory();
    Hive.init(themeDatabaseDir.path);
    if (await Hive.boxExists('themeBox')) {
      themeBox = await Hive.openBox('themeBox');
    } else {
      createDatabase();
    }
  }

  static Future<void> createDatabase() async {
    Directory themeDatabaseDir = await getApplicationSupportDirectory();
    Hive.init(themeDatabaseDir.path);
    Hive.registerAdapter(ThemeDatabaseAdapter());
    themeBox = await Hive.openBox('themeBox');
//0 = light theme
    await themeBox.put('themeSettings', 0);
  }

  static putThemeSettings(int themeFlag) {
    themeBox.put('themeSettings', themeFlag);
  }

  static int getThemeSettings() {
    int themeValue = themeBox?.get('themeSettings') ?? 0;
    return themeValue;
  }
}
