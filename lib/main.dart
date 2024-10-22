export 'package:manager/manager.dart';

import 'package:rebuilder_docs/objectbox.g.dart';

import 'main.dart';

export 'dart:io';

export 'package:colornames/colornames.dart';
export 'package:flex_color_scheme/flex_color_scheme.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
// export 'package:google_fonts/google_fonts.dart';
export 'package:path_provider/path_provider.dart';
export 'package:rebuilder_docs/backup/backup_page.dart';
export 'package:rebuilder_docs/get_started.dart';
export 'package:rebuilder_docs/settings/settings_page.dart';
export 'package:rebuilder_docs/settings/settings.dart';
export 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // GoogleFonts.config.allowRuntimeFetching = false;
  final appInfo = await PackageInfo.fromPlatform();
  await RM.storageInitializer(HiveStorage());
  store = await openStore(
    directory: (await getApplicationDocumentsDirectory()).path + appInfo.appName,
  );
  runApp(const App());
}

class App extends ImperativeUI {
  const App({super.key});
  get theme => FlexThemeData.light(
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: settings().materialColor,
      ),
      subThemesData: FlexSubThemesData(
        defaultRadius: settings().borderRadius,
      ),
      lightIsWhite: true);
  get darkTheme => FlexThemeData.dark(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: settings().materialColor,
          brightness: Brightness.dark,
        ),
        darkIsTrueBlack: true,
        subThemesData: FlexSubThemesData(
          defaultRadius: settings().borderRadius,
        ),
      );
  get themeMode => settings().themeMode;

  @override
  home(_) => GetStartedPage();
}

late Store store;
