import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/models/user.model.dart';
import 'package:alumni_hub/providers/authentication.dart';
import 'package:alumni_hub/views/home.screen.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  String? name;
  String? email;
  String? password;
  bool _hide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [buildTitle(), buildForm()]),
      ),
    );
  }

  buildTitle() {
    return SizedBox(
        height: 88,
        child: ListView(children: [
          Text(
            'Sign up',
            style: titleStyle,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Insert your detail to sign up',
              style: headerInfoStyle,
            ),
          )
        ]));
  }

  buildForm() {
    return Expanded(
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.person),
                        labelText: 'Name',
                        border: OutlineInputBorder()),
                    onChanged: (value) => setState(() {
                          name = value;
                        }),
                    validator: (value) {
                      RegExp exp = RegExp(r"^[a-zA-Z ]+$",
                          caseSensitive: false, unicode: true, dotAll: true);
                      if (exp.hasMatch(value!)) {
                        return null;
                      } else if (value.isEmpty) {
                        return 'Please insert name!';
                      } else {
                        return 'Only text are allowed';
                      }
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.mail),
                        labelText: 'Email',
                        border: OutlineInputBorder()),
                    onChanged: (value) => setState(() {
                      email = value;
                    }),
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
                  ),
                ),
                TextFormField(
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
                  onChanged: (value) => setState(() {
                    password = value;
                  }),
                  validator: (value) {
                    ///check contain digit r"(?=.*\d)
                    ///check length at least 6 input [a-zA-Z0-9]{6}
                    ///check contain symbol (?=.*\W)
                    ///check contain upper case (?=.*[A-Z])
                    RegExp exp =
                        RegExp(r"(?=.*\d)(?=.*[A-Z])(?=.*\W)[a-zA-Z0-9]{6}");
                    if (exp.hasMatch(value!)) {
                      return null;
                    } else if (value.isEmpty) {
                      return 'Please Insert password';
                    } else if (value.length < 6) {
                      return 'Please insert password more than 6 characters';
                    } else {
                      return 'Must contain combination of upper case, number and symbol';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          fixedSize: const Size(328, 48)),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          try {
                            await Provider.of<Authentication>(context,
                                    listen: false)
                                .register(email!, password!);
                            if (!mounted) return;
                            await Provider.of<Authentication>(context,
                                    listen: false)
                                .setName(name!);
                            if (!mounted) return;

                            var user = FirebaseAuth.instance.currentUser;

                            if (user != null) {
                              UserModel userModel = UserModel(
                                  userEmail: user.email,
                                  userId: user.uid,
                                  userName: user.displayName ?? name,
                                  userPicUrl: user.photoURL ?? userIcon);
                              await Provider.of<Authentication>(context,
                                      listen: false)
                                  .update(userModel);
                            }
                            if (!mounted) return;
                            Navigator.pushAndRemoveUntil(
                                context,
                                RouteAnimate(
                                    builder: (context) => const HomeScreen()),
                                (route) => false);
                          } on FirebaseAuthException catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.message!)));
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(e.toString())));
                          }

                          //try catch here
                        }
                      },
                      child: const Text('REGISTER')),
                ),
              ],
            )));
  }
}
