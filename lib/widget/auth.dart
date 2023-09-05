// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class AuthScreeen extends StatefulWidget {
  const AuthScreeen({super.key});

  @override
  State<AuthScreeen> createState() => _AuthScreeenState();
}

class _AuthScreeenState extends State<AuthScreeen> {
  var _isLogin = true;

  var _enteredEmail = '';
  var _enteredPassword = '';

  final _form = GlobalKey<FormState>();

  void _submit() {
   final isValid = _form.currentState!.validate();
   if(isValid){
    _form.currentState!.save();
    print(_enteredEmail);
    print(_enteredPassword);
   }
  }
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
                  key: _form,
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
                        validator: (value) {
                          if (value == null ||
                              value.trim().isEmpty ||
                              !value.contains('@')) {
                            return 'Please enter a valid email address.';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _enteredEmail = value!;
                        },
                      ),
                      TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Password",
                          ),
                          obscureText: true, //invisiable the txt
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              return 'Password must be atleast 6 charaters long ';
                            }
                            return null;
                          },
                          onSaved: (value) {
                          _enteredPassword = value!;
                        },),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: _submit,
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
