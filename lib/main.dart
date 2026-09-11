import 'package:davai_store/core/data/providers/locale_provider.dart';
import 'package:davai_store/core/data/providers/theme_provider.dart';
import 'package:davai_store/core/router/router.dart';
import 'package:davai_store/core/theme/theme.dart';
import 'package:davai_store/features/auth/presentation/providers/user_session_provider.dart';
import 'package:davai_store/localization/strings.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer();

  // تحميل الجلسة
  await container.read(userSessionControllerProvider.notifier).loadSession();

  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: TranslationProvider(child: const MyApp()),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(themeProvider.notifier).load();
      ref.read(localeProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final locale = ref.watch(localeProvider);

    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      locale: locale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,

      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: theme,

      routerConfig: router,
    );
  }
}
