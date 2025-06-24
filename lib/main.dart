import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yumio/src/app/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(
      Yumio(),
      // DevicePreview(enabled: !kReleaseMode, builder: (context) => Yumio()),
    );
  });
}
