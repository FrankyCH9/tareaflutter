import 'package:flutter/material.dart';


void main() {
  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  TextEditingController _loginEmailController = TextEditingController();
  TextEditingController _loginPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _loginFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _loginEmailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                ),
              ),
              TextFormField(
                controller: _loginPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_loginFormKey.currentState!.validate()) {
                    _showDialog('Inicio de sesión exitoso');
                  }
                },
                child: Text('Iniciar sesión'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
                },
                child: Text('¿No tienes una cuenta? Regístrate aquí'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mensaje'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController _registerEmailController = TextEditingController();
  TextEditingController _registerPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _registerFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: _registerEmailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu correo electrónico';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Correo electrónico',
                ),
              ),
              TextFormField(
                controller: _registerPasswordController,
                obscureText: true,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Por favor, ingresa tu contraseña';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_registerFormKey.currentState!.validate()) {
                    _showDialog('Registro exitoso');
                  }
                },
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Mensaje'),
          content: Text(message),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
