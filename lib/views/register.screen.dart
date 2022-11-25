import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                        suffixIcon: Icon(Icons.mail),
                        labelText: 'Email',
                        border: OutlineInputBorder()),
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
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor,
                          fixedSize: const Size(328, 48)),
                      onPressed: () {},
                      child: const Text('REGISTER')),
                ),
              ],
            )));
  }
}
