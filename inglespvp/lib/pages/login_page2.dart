import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inglespvp/widgets/auth_button.dart';

class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Background(),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Image(image:  AssetImage('assets/logo_white.png'), fit: BoxFit.contain, height: 200,),
                ],

              ),
              Text('¡Únete a la Experiencia Lingo!', style: TextStyle(
                fontSize: 24, 
                fontWeight: FontWeight.bold, 
                color: Colors.white
                ), 
                textAlign: TextAlign.center,
                ),
              Login_buttons(),
              SizedBox(height:20),
              Text('No compartiremos nada sin tu permiso', style: TextStyle(
                fontSize: 14, 
                color: Colors.white70
                ), 
                textAlign: TextAlign.center,
                ),
              TextoPoliticaPrivacidad(),

            ],
          )
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
   Background({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0XFF0D2444),
            Color(0xFF07172C),
          ],
        ),
      ),
    );
  }
}

class Login_buttons extends StatelessWidget {
  const Login_buttons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        AuthButton(
          text: 'Iniciar sesión con Google',
          leadingIcon: Image.asset('assets/google.png', height: 20, ), // Le puse color oscuro al logo para que se vea en el fondo claro
          backgroundColor: const Color(0xFFD9E4F5),
          textColor: const Color(0xFF1A263F),
          onPressed: () => print('Google Login'),
        ),
        AuthButton(
          text: 'Iniciar sesión con Facebook', 
          leadingIcon: Image.asset('assets/facebook.png', height: 20, width: 20, fit: BoxFit.contain,), 
          backgroundColor: const Color(0xFFD9E4F5), 
          textColor: const Color(0xFF1A263F), 
          onPressed: () => print('Facebook Login')
        ),
        AuthButton(
          text: 'Iniciar sesión con Email', 
          leadingIcon: Icon(Icons.email, size: 20, color: const Color(0xFF1A263F)),
          backgroundColor: const Color(0xFFD9E4F5), 
          textColor: const Color(0xFF1A263F), 
          onPressed: () => print('Email Login')
        ),
        AuthButton(
          text: 'Iniciar sesión con Telefono', 
          leadingIcon: Icon(Icons.phone, size: 20, color: const Color(0xFF1A263F)),
          backgroundColor: const Color(0xFFD9E4F5), 
          textColor: const Color(0xFF1A263F), 
          onPressed: () => print('Phone Login')
        ),

      ],
    );
  }
}

class TextoPoliticaPrivacidad extends StatelessWidget {
  const TextoPoliticaPrivacidad({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            height: 1.5,
          ),
          children: [
            const TextSpan(text: 'Al crear una cuenta, aceptas nuestros '),
            TextSpan(
              text: 'Términos de uso.',
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Navegando a Términos...');
                  // Navigator.push(context, ...);
                },
            ),
            const TextSpan(text: '\nAverigua como usamos tu información en nuestra '),
            TextSpan(
              text: 'Política de privacidad.',
              style: const TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  print('Navegando a Privacidad...');
                },
            ),
          ],
        ),
      ),
    );
  }
}