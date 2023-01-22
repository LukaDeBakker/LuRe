import 'package:flutter/material.dart';
import 'package:lure/api/mangadex_api.dart';
import 'home_page.dart';
import 'package:lure/utils/form_validator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: const <Widget>[
            Center(
              child: Text(
                'Hashi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 64,
                  color: Colors.orange,
                ),
              ),
            ),
            SizedBox(height: 48),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final MangaDexapi _mangaDexapi = MangaDexapi();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> login() async {
    // This will be my main login function
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Processing Data'),
        backgroundColor: Colors.green.shade300,
      ));
    } else {
      return;
    }

    final token = await _mangaDexapi.login(
        usernameController.text, passwordController.text);

    // Check out how this works and how to avoid it in the future.
    if (!mounted) {
      return;
    }

    if (token.result == "ok") {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Invalid login credentials.'),
        backgroundColor: Colors.red.shade300,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: usernameController,
            keyboardType: TextInputType.text,
            validator: (value) {
              return LoginFormValidator.validateEmail(value ?? "");
            },
            decoration: InputDecoration(
                labelText: 'Userame',
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                )),
          ),
          const SizedBox(height: 8),
          TextFormField(
            controller: passwordController,
            autofocus: false,
            obscureText: true,
            validator: (value) {
              return LoginFormValidator.validatePassword(value ?? "");
            },
            decoration: InputDecoration(
                labelText: 'Password',
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                )),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                backgroundColor: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(64),
                ),
              ),
              onPressed: login,
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
