import 'package:auto_route/auto_route.dart';
import 'package:eproperty/helper/helper.dart';
import 'package:eproperty/route/router.gr.dart';
import 'package:eproperty/value/value.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future<void> initialization() async {
  await DatabaseHelper().initialize();
}

Future<void> main() async {
  await initialization();

  runApp(
    // For widgets to be able to read providers, we need to wrap the entire
    // application in a "ProviderScope" widget.
    // This is where the state of our providers will be stored.
    ProviderScope(
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(_) {
    return MaterialApp(
      title: CustomStrings.APP_NAME,
      theme: CustomTheme().lightThemeData,
      builder: ExtendedNavigator<Router>(
        router: Router(),
        initialRoute: Routes.authView,
      ),
    );
  }
}
