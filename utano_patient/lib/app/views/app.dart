import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:handy_extensions/handy_extensions.dart';

import '../../auth/views/pages/utano_landing.dart';
import '../../core/configs/colors.dart';
import '../../core/configs/theme.dart';
import '../../core/functions/dismiss_keyboard.dart';
import '../../core/widgets/device_offline_page.dart';
import '../../core/widgets/loader_widget.dart';
import '../../l10n/l10n.dart';
import '../blocs/connectivity/connectivity_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColors.background,
      theme: AppTheme().lightTheme,
      darkTheme: AppTheme().darkTheme,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Utano',
      builder: (context, widget) {
        return GestureDetector(
          onTap: () => dismissKeyboard(context),
          child: widget,
        );
      },
      home: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          late Widget displayedWidget;

          if (state is ConnectivityConnected) {
            displayedWidget = const UtanoLandingPage();
          } else if (state is ConnectivityDisconnected) {
            displayedWidget = const DeviceOfflinePage();
          } else {
            displayedWidget = Container(
              color: AppColors.background,
              height: context.height,
              width: context.width,
              alignment: Alignment.center,
              child: const LoaderWidget(),
            );
          }

          return AnimatedSwitcher(
            duration: const Duration(
              milliseconds: 200,
            ),
            child: displayedWidget,
          );
        },
      ),
    );
  }
}
