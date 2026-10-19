import 'package:flutter/material.dart';

import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';

void main() {
  runApp(const HotelLaMansionApp());
}

class HotelLaMansionApp extends StatelessWidget {
  const HotelLaMansionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel La Mansión',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.black,
          indicatorColor: Color(0xFF424242),
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(color: Colors.white),
          ),
          iconTheme: WidgetStatePropertyAll(IconThemeData(color: Colors.white)),
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}
