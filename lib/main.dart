import 'package:ciscos/provider/product.dart';
import 'package:ciscos/screens/Mainpage.dart';
import 'package:ciscos/screens/add_address.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import './screens/registration.dart';
import './screens/signu.dart';
import 'package:flutter/material.dart';

import 'screens/create_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    showSemanticsDebugger: false,
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primaryColor: Colors.teal),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    initialise();
    super.initState();
  }

  initialise() async {
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Product(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.teal and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.teal,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Mainpage();
            }
            return HomeScreen();
          }),
        ),
        initialRoute: '/',
        routes: {
          '/signup': (context) => SignUp(),
          '/reg': (context) => Registration(),
          '/main': (context) => Mainpage(),
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              stops: [0.1, 0.5, 0.7, 0.9],
              colors: [
                Color.fromARGB(255, 39, 168, 155),
                Color.fromARGB(255, 48, 126, 210),
                Color.fromARGB(255, 37, 62, 205),
                Color.fromARGB(255, 11, 37, 187),
              ],
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "Farmers friend",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontFamily: GoogleFonts.playball().fontFamily,
                      ),
                    )),
                SizedBox.fromSize(
                  size: Size.fromHeight(50),
                ),

                Container(
                  width: 230,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  height: 50.0,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Route route =
                          MaterialPageRoute(builder: (context) => SignUp());
                      Navigator.push(context, route);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 250.0, minHeight: 30.0),
                        alignment: Alignment.center,
                        child: const Text(
                          "Login",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 230,
                  margin: EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () {
                      Route route = MaterialPageRoute(
                          builder: (context) => Registration());
                      Navigator.push(context, route);
                    },
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 250.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: const Text(
                          "Register",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(
                //               builder: (context) => Registration()));
                //     },
                //     child: Text("Regisister"))
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  child: SignInButton(
                    Buttons.Google,
                    onPressed: () {
                      var auth = FirebaseAuth.instance
                          .signInWithProvider(GoogleAuthProvider());
                      if (auth != Null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Mainpage()));
                      } else {
                        showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 200,
                                color: Colors.teal,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      const Text('Authertication failed'),
                                      ElevatedButton(
                                        child: const Text('Try again'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    },
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
