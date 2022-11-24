import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  var _value = false;

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
                decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.person),
                    labelText: 'Email',
                    border: OutlineInputBorder()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: TextFormField(
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
                  onPressed: () {},
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
            TextButton(onPressed: () {}, child: const Text('Register Here'))
          ],
        ),
      ),
    );
  }
}
