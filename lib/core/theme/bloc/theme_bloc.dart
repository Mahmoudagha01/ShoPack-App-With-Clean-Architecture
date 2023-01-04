import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopack_user/core/theme/theme_service.dart';
import '../../utilities/enums.dart';
import '../theme_data.dart';


part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  // light theme by default
  ThemeBloc()
      : super(ThemeState(
            themeData: appThemeData[
                AppTheme.values[ThemeDatabaseService.getThemeSettings()]]!)) {
    on<ThemeEvent>((event, emit) {
      if (event is ThemeChanged) {
        emit.call(ThemeState(themeData: appThemeData[event.theme]!));
      }
    });
  }
}
