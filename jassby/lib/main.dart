import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

/// MyApp is the widget and root of my demo application.
/// Try to adhere to proper documentation in code:
///   https://dart.dev/guides/language/effective-dart/documentation
class MyApp extends StatelessWidget {
  /// My constant for the title of the app.
  static const String _title = 'Jassby Flutter Demo';

  @override
  Widget build(BuildContext context) {
    /// Building my custom app using Google Material design.
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Login',
                style: TextStyle(fontSize: 25, color: Colors.black87)),
          ),
          backgroundColor: Colors.white,
        ),
        body: LoginPage(),
      ),
    );
  }
}

/// This login screen will be stateful because of the use of the form inside.
class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

/// Class contains the state and we can build our layout and elements
/// programmatically using Flutter's widgets.
/// Layout widget info found here:
///   https://flutter.dev/docs/development/ui/widgets/layout
/// Form imput widget elements:
///   https://flutter.dev/docs/development/ui/widgets/input
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    /// Email input element def and style.
    final emailInputElement = TextFormField(
      obscureText: false,
      decoration: new InputDecoration.collapsed(
          hintText: 'Enter Email',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          )),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Email is required';
        }
        return null;
      },
    );

    /// Password input element def and style.
    /// Added the obscureText to hide password.
    final passwordInputElement = TextFormField(
      obscureText: true,
      decoration: new InputDecoration.collapsed(
          hintText: 'Enter Password',
          hintStyle: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          )),
      validator: (String value) {
        if (value.trim().isEmpty) {
          return 'Password is required';
        }
        return null;
      },
    );

    /// Login button element def and style.
    /// TODO: add actual functionality when button is pressed.
    final loginButtonElement = Material(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.grey,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {},
        child: Text(
          "Next",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
      ),
    );

    // Return a Form object with all the pieces, children, and formatting done.
    return Form(
      key: _formKey,
      child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(36.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 45.0),
              emailInputElement,
              SizedBox(height: 25.0),
              passwordInputElement,
              SizedBox(height: 35.0),
              new RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Having trouble logging in? ',
                      style: new TextStyle(color: Colors.black),
                    ),
                    new TextSpan(
                      text: 'Forgot Password',
                      style: new TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          /// TODO: replace links with actual urls.
                          launch(
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.0),
              new RichText(
                text: new TextSpan(
                  children: [
                    new TextSpan(
                      text: 'Using a legacy linked account?      ',
                      style: new TextStyle(color: Colors.black),
                    ),
                    new TextSpan(
                      text: 'Get Help',
                      style: new TextStyle(
                          color: Colors.green, fontWeight: FontWeight.w600),
                      recognizer: new TapGestureRecognizer()
                        ..onTap = () {
                          /// TODO: replace links with actual urls.
                          launch(
                              'https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45.0),
              loginButtonElement,
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
