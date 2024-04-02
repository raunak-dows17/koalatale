import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'router/router.dart';
import 'shared/colors.dart';

void main() {
  runApp(const KoalataleApp());
}

class KoalataleApp extends StatelessWidget {
  const KoalataleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Koalatale',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          background: AppColors.backgroundColor,
        ),
        fontFamily: GoogleFonts.kumbhSans().fontFamily,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(AppColors.primaryColor),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(color: Colors.white),
            ),
            shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.tertiaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      routerConfig: AppRouter().router,
    );
  }
}
