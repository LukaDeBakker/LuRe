import 'package:flutter/material.dart';
import 'home_page.dart';

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
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email',
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                )),
          ),
          const SizedBox(height: 8),
          TextFormField(
            autofocus: false,
            obscureText: true,
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
              onPressed: () {
                // validate form.
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const HomePage()),
                  ),
                );
              },
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
