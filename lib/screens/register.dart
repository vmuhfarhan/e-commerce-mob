import 'package:flutter/material.dart';
import 'package:e_commerce_mob/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _passwordConfirmationController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Register'),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                                border: OutlineInputBorder(),
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordConfirmationController,
                            decoration: const InputDecoration(
                                labelText: 'Konfirmasi Password',
                                border: OutlineInputBorder(),
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;
                                String confirmPassword = _passwordConfirmationController.text;

                                if (password != confirmPassword) {
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(const SnackBar(
                                            content: Text("Password dan konfirmasi password harus sama!"),
                                        ));
                                    return;
                                }

                                final response = await request.post(
                                    "http://127.0.0.1:8000/register/",
                                    {
                                        'username': username,
                                        'password': password,
                                    });

                                if (response['status']) {
                                    String message = response['message'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginPage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(SnackBar(
                                            content: Text("$message Silakan login.")));
                                } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Registrasi Gagal'),
                                            content: Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Register'),
                        ),
                        const SizedBox(height: 12.0),
                        TextButton(
                            onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                            },
                            child: const Text('Sudah punya akun? Login disini'),
                        ),
                    ],
                ),
            ),
        );
    }
}