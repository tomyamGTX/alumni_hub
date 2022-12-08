import 'package:alumni_hub/providers/authentication.dart';
import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/views/home.screen.dart';
import 'package:alumni_hub/views/register.screen.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var _value = false;
  String? email;
  String? password;
  var _hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [buildTitle(), buildForm(), buildFooter()],
    ));
  }

  buildTitle() {
    return Flexible(
      fit: FlexFit.loose,
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56.0),
        child: ListView(
          shrinkWrap: true,
          primary: false,
          children: [
            Text(
              'Let\'s get started!',
              textAlign: TextAlign.center,
              style: headerTitleStyle,
            ),
            Text(
              'Login to watch videos and receive event\'s notifications',
              textAlign: TextAlign.center,
              style: headerInfoStyle,
            )
          ],
        ),
      ),
    );
  }

  buildForm() {
    return Flexible(
      fit: FlexFit.tight,
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            primary: false,
            children: [
              TextFormField(
                onChanged: (v) {
                  setState(() {
                    email = v;
                  });
                },
                validator: (v) {
                  RegExp exp = RegExp(
                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

                  if (exp.hasMatch(v!)) {
                    return null;
                  } else if (v.isEmpty) {
                    return 'Please Insert email';
                  } else {
                    return 'Please Insert valid email';
                  }
                },
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    labelText: 'Email',
                    border: OutlineInputBorder()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
                  onChanged: (value) => setState(() {
                    password = value;
                  }),
                  validator: (v) {
                    ///check contain digit r"(?=.*\d)
                    ///check length at least 6 input [a-zA-Z0-9]{6}
                    ///check contain symbol (?=.*\W)
                    ///check contain upper case (?=.*[A-Z])
                    RegExp exp =
                        RegExp(r"(?=.*\d)(?=.*[A-Z])(?=.*\W)[a-zA-Z0-9]{6}");

                    if (exp.hasMatch(v!)) {
                      return null;
                    } else if (v.isEmpty) {
                      return 'Please Insert password';
                    } else if (v.length < 6) {
                      return 'Please insert password more than 6 characters';
                    } else {
                      return 'Must contain combination of upper case, number and symbol';
                    }
                  },
                  obscureText: _hide,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: () => setState(() {
                                _hide = !_hide;
                              }),
                          icon: Icon(
                              _hide ? Icons.visibility_off : Icons.visibility)),
                      labelText: 'Password',
                      border: const OutlineInputBorder()),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  children: [
                    Checkbox(
                        value: _value,
                        onChanged: (v) {
                          setState(() {
                            _value = !_value;
                          });
                        }),
                    Text(
                      'Keep me logged in',
                      style: GoogleFonts.roboto(fontSize: 16),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColor,
                      fixedSize: const Size(312, 48)),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await Provider.of<Authentication>(context,
                                listen: false)
                            .login(email!, password!);
                        if (!mounted) return;
                        Navigator.push(
                            context,
                            RouteAnimate(
                                builder: (context) => const HomeScreen()));
                      } on FirebaseAuthException catch (e) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(SnackBar(content: Text(e.message!)));
                      }
                    }
                  },
                  child: const Text('LOGIN')),
            ],
          ),
        ),
      ),
    );
  }

  buildFooter() {
    return Flexible(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('No account yet?'),
            TextButton(
                onPressed: () => Navigator.push(context,
                    RouteAnimate(builder: (context) => const Register())),
                child: const Text('Register Here'))
          ],
        ),
      ),
    );
  }
}
