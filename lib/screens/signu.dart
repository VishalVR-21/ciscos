import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp();
  static const routename = "./signup";
  @override
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Farmers friend',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    )),
                Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      'Login',
                      style: TextStyle(fontSize: 20),
                    )),
                Container(
                  padding: const EdgeInsets.all(10),
                  child: TextField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: password,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    //forgot password screen
                  },
                  child: const Text(
                    'Forgot Password',
                  ),
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        var firebase = FirebaseAuth.instance;
                        if (firebase.isSignInWithEmailLink(email.text)) {
                          AlertDialog(
                            actions: [
                              Text('this email is present with other account')
                            ],
                          );
                        }

                        var result = firebase.signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                        // This is the place where you enoroute to main page;
                      },
                    )),

                // Row(
                //   children:[
                //     Text('Does not have account?'),
                //     TextButton(
                //       child: const Text(
                //         'Sign in',
                //         style: TextStyle(fontSize: 20),
                //       ),
                //       onPressed: () {
                //         //signup screen
                //       },
                //     )
                //   ],
                //   mainAxisAlignment: MainAxisAlignment.center,
                // ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        OutlinedButton(
                          child: Text(
                            "Register account",
                            style: TextStyle(color: Colors.blue),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
