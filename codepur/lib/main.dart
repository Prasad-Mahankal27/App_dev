import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
   late AnimationController _iconAnimationController;
   late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.bounceOut,
    );

    _iconAnimation.addListener(() => setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.network(
            "https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2.0,f_auto,g_center,h_1080,q_100,w_1080/v1/gcs/platform-data-goog/events/flutter_0G48Si8.png",
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ), //background blend
          Form(
            child: Theme(
            data: ThemeData(
              brightness: Brightness.dark,
              primarySwatch: Colors.teal,
              inputDecorationTheme: const InputDecorationTheme(
                labelStyle: TextStyle(
                  color: Colors.teal,
                  fontSize: 20.0,
                )
              )
            ), //theme
            child: Container(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   _iconAnimation.isCompleted
                ? FlutterLogo(size: _iconAnimation.value * 100)
                : Container(), // Hide the logo until animation is completed
           //logo
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter Email",
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Enter Password",
                    ),
                    keyboardType: TextInputType.emailAddress,
                    obscureText: true, //dot dot while typing / hide
                  ),
                  const Padding(padding: EdgeInsets.only(top: 60.0),
                  ),
                  MaterialButton(height: 60, minWidth: 100,onPressed:(){}, color: Colors.teal, textColor: Colors.white,  splashColor: Colors.redAccent, child: const Icon(Icons.login)),
                ],
              ),
            ), //input data
          ))
        ],
      ),
    );
  }
}

//  stack -> widget list -> 1) blend background
//                          2) form -> theme -> Container -> Column -> 1) logo 2) textfields 3) button