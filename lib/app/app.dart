import 'package:flutter/material.dart';
import 'package:kinbook/core/core.dart';
import 'package:kinbook/features/features.dart';
import 'app_state.dart';

class KinbookApp extends StatefulWidget {
  const KinbookApp({super.key});

  @override
  State<KinbookApp> createState() => _KinbookAppState();
}

class _KinbookAppState extends State<KinbookApp> {
  late final KinbookState _appState = KinbookState();

  @override
  Widget build(BuildContext context) => KinbookStateScope(
        notifier: _appState,
        child: MaterialApp(
          title: 'Kinbook',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          home: const OnboardingScreen(),
        ),
      );
}
