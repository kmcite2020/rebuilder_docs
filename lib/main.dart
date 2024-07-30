import 'main.dart';

export 'dart:io';

export 'package:colornames/colornames.dart';
export 'package:flex_color_scheme/flex_color_scheme.dart';
export 'package:flutter/material.dart';
export 'package:flutter_native_splash/flutter_native_splash.dart';
// export 'package:google_fonts/google_fonts.dart';
export 'package:path_provider/path_provider.dart';
export 'package:rebuilder_docs/features/backup/pages/backup_page.dart';
export 'package:rebuilder_docs/features/home_page.dart';
export 'package:rebuilder_docs/features/settings/pages/settings_page.dart';
export 'package:rebuilder_docs/features/settings/settings.dart';
export 'package:states_rebuilder/states_rebuilder.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // GoogleFonts.config.allowRuntimeFetching = false;
  await initializePages();
  RM.storageInitializer(HiveStorage());
  runApp(
    const App(),
  );
}

class HiveStorage extends IPersistStore {
  @override
  Future<void> delete(String key) async {}

  @override
  Future<void> init() async {}

  @override
  Object? read(String key) {
    return null;
  }

  @override
  Future<void> write<T>(String key, T value) async {}
}

typedef UI = ReactiveStatelessWidget;

abstract class TopUI extends UI {
  const TopUI({super.key});
  Widget get navigation;
  ThemeMode get themeMode => ThemeMode.system;
  ThemeData get theme => ThemeData.light();
  ThemeData get darkTheme => ThemeData.dark();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      themeMode: themeMode,
      darkTheme: darkTheme,
      home: navigation,
    );
  }
}

class App extends TopUI {
  const App({super.key});
  get theme => FlexThemeData.light(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: settings().materialColor,
        ),
        subThemesData: FlexSubThemesData(
          defaultRadius: settings().borderRadius,
        ),
      );
  get darkTheme => FlexThemeData.dark(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: settings().materialColor,
          brightness: Brightness.dark,
        ),
        subThemesData: FlexSubThemesData(
          defaultRadius: settings().borderRadius,
        ),
      );
  get themeMode => settings().themeMode;

  @override
  get navigation => HomePage();
}

extension InjectedExtensions<T> on Injected<T> {
  Widget build(Widget Function(T state) builder) => this.onAll<Widget>(
        onWaiting: () => CircularProgressIndicator(),
        onError: (_, __) => ErrorWidget.withDetails(message: _.toString()),
        onData: builder,
      );
}

extension DynamicExtensions on dynamic {
  Text text({double textScaleFactor = 1}) {
    return Text(
      toString(),
      textScaler: TextScaler.linear(textScaleFactor),
    );
  }
}

extension WidgetExtensions on Widget {
  Padding pad({
    double? all,
    double? right,
    double? left,
    double? top,
    double? bottom,
    double? horizontal,
    double? vertical,
  }) {
    EdgeInsetsGeometry edgeInsets = EdgeInsets.zero;

    if (all != null) {
      edgeInsets = EdgeInsets.all(all);
    } else if (horizontal != null || vertical != null) {
      edgeInsets = EdgeInsets.symmetric(
        vertical: vertical ?? 0.0,
        horizontal: horizontal ?? 0.0,
      );
    } else if (right != null || left != null || top != null || bottom != null) {
      edgeInsets = EdgeInsets.only(
        left: left ?? 0.0,
        right: right ?? 0.0,
        top: top ?? 0.0,
        bottom: bottom ?? 0.0,
      );
    } else {
      edgeInsets = EdgeInsets.all(8.0);
    }

    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }

  Widget center() => Center(child: this);
  Card card() => Card(child: this);
}

// String get randomID => Uuid().v8();
