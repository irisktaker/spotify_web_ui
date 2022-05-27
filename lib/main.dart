import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:provider/provider.dart';
import 'package:spotify/constants/app_theme.dart';
import 'package:spotify/models/current_track_model.dart';
import 'package:spotify/views/screens/shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => CurrentTrackModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Spotify UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkThemeMode,
      home: const Shell(),
    );
  }
}
