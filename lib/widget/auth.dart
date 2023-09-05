// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class AuthScreeen extends StatefulWidget {
  const AuthScreeen({super.key});

  @override
  State<AuthScreeen> createState() => _AuthScreeenState();
}

class _AuthScreeenState extends State<AuthScreeen> {
  var _isLogin = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 20),
              width: 200,
              child: Image.asset('images/chat.png'),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, top: 0, bottom: 10, right: 10),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Password",
                        ),
                        obscureText: true, //invisiable the txt
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(_isLogin ? 'Login' : 'Signup'),
                          ),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(_isLogin
                              ? 'Create the account!'
                              : 'I have already have acccout! Login'),
                              ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
