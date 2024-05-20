import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/switchProvider.dart';
import '../../provider/theme_provider.dart';
import '../../view/screen/Ios/ios_Screen.dart';
import '../../view/screen/material/material_screen.dart';

class AdaptiveScreen extends StatelessWidget {
  const AdaptiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isActive = Provider.of<SwitchProvider>(context).isActive;
    final isDarkMode = Provider.of<ThemeProvider>(context).isDarkMode;


    if (isActive) {
      return MaterialApp(
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const MaterialScreen(),
      );
    } else {
      return Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoTheme(
              data: CupertinoThemeData(
                brightness: themeProvider.isDarkMode
                    ? Brightness.dark
                    : Brightness.light,
              ),
              child: const Ios_Screen(),
            ),
          );
        },
      );
    }
  }
}
