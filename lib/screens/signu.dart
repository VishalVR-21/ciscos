import 'package:ciscos/screens/Mainpage.dart';
import 'package:ciscos/screens/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp();

  static const routename = "./signup";

  TextEditingController password = TextEditingController();

  @override
  TextEditingController email = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * .08,
        backgroundColor: Colors.teal,
      ),
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
                          color: Colors.white,
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
                      onPressed: () async {
                        // var data = await FirebaseAuth.instance
                        //     .fetchSignInMethodsForEmail(email.text);
                        // print(data);
                        var firebase = FirebaseAuth.instance;

                        var result = firebase.signInWithEmailAndPassword(
                            email: email.text, password: password.text);
                        // This is the place where you enoroute to main page;
                        if (result != Null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mainpage()));
                        }
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
                            style: TextStyle(
                              color: Colors.teal,
                            ),
                          ),
                          onPressed: () {
                            PageRoute n = MaterialPageRoute(
                                builder: (context) => Registration());
                            Navigator.pushReplacement(context, n);
                          },
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
