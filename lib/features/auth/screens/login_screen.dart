import 'package:flutter/material.dart';
import 'package:hotel_la_mansion/features/auth/services/auth_service.dart';
import 'package:hotel_la_mansion/features/auth/widgets/custom_text_field.dart';
import 'package:hotel_la_mansion/features/dashboard/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController(
    text: 'emilys',
  );
  final TextEditingController _passwordController = TextEditingController(
    text: 'emilyspass',
  );

  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _iniciarSesion() async {
    setState(() {
      _isLoading = true;
    });

    bool success = await _authService.login(
      _usernameController.text,
      _passwordController.text,
    );

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Inicio de sesión exitoso!')));

      //navegacion a la pantalla principal
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardScreen()),
      );
    } else {
      //login incorrecto
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al iniciar sesión.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/logohotel.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
              Text(
                'Bienvenido a Hotel La Mansión',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF023B90)),
                textAlign: TextAlign.center,
                
              ),
              SizedBox(height: 40),
              CustomTextField(
                controller: _usernameController,
                label: 'Username',
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                label: 'Password',
                //isPassword: true,
              ),
              SizedBox(height: 32),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF023B90),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _iniciarSesion,
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(fontSize: 18),
                        
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
