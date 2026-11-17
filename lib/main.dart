import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hotel_la_mansion/features/auth/screens/auth_check_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es', null);
  runApp(const HotelLaMansionApp());
}

class HotelLaMansionApp extends StatelessWidget {
  const HotelLaMansionApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryBlue = Color(0xFF023B90);
    const backgroundCream = Color(0xFFFDF3E1);

    return MaterialApp(
      title: 'Hotel La Mansión',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryBlue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: backgroundCream,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: primaryBlue,
          indicatorColor: backgroundCream,
          labelTextStyle: WidgetStateProperty.resolveWith(
            (states) => TextStyle(
              color: states.contains(WidgetState.selected)
                  ? primaryBlue
                  : Colors.white,
              fontWeight: states.contains(WidgetState.selected)
                  ? FontWeight.w700
                  : FontWeight.w400,
            ),
          ),
          iconTheme: WidgetStateProperty.resolveWith(
            (states) => IconThemeData(
              color: states.contains(WidgetState.selected)
                  ? primaryBlue
                  : Colors.white,
            ),
          ),
        ),
      ),
      home: const AuthCheckScreen(),
    );
  }
}
