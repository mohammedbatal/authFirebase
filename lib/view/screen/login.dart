import 'package:authfirebase/view/screen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  void _handleLogin() async {
    try {
      UserCredential uerCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passController.text,
      );
      print('==============email');
      print('User logged: ${uerCredential.user!.email}');
      print('==============email');
    } catch (e) {
      print('The Error is : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("login Page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                      return null;
                    },
                    // onChanged: (val) {
                    //   setState(() {
                    //     _email = val;
                    //   });
                    // },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Your Password';
                      }
                      return null;
                    },
                    // onChanged: (val) {
                    //   setState(() {
                    //     _password = val;
                    //   });
                    // },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        //!
                        if (_formKey.currentState!.validate()) {
                          _handleLogin();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomePage()),
                          );
                        }
                      },
                      child: const Text("login"))
                ],
              )),
        ),
      ),
    );
  }
}
