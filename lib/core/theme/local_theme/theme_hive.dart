import 'package:hive/hive.dart';

part 'theme_hive.g.dart';

@HiveType(typeId: 0)
class ThemeDatabase {
  @HiveField(0)
  int themeSettings;
  ThemeDatabase({required this.themeSettings});
}
