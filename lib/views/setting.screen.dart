import 'package:alumni_hub/providers/authentication.dart';
import 'package:alumni_hub/const.dart';
import 'package:alumni_hub/views/auth/login.screen.dart';
import 'package:alumni_hub/widgets/route.animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _value = false;

  var loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'App Settings',
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [buildReminder(), buildMySetting(), logOutButton()],
        ),
      ),
    );
  }

  Widget buildReminder() => SizedBox(
        height: 160,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Reminder',
                style: GoogleFonts.roboto(
                    fontSize: 14, fontWeight: FontWeight.w500, height: 2.4),
              ),
            ),
            ListTile(
              title: Text(
                'Notifications',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w400, height: 2.4),
              ),
              trailing: Switch(
                  activeColor: kPrimaryColor,
                  value: _value,
                  onChanged: (v) => setState(() {
                        _value = v;
                      })),
            )
          ],
        ),
      );
  Widget buildMySetting() => SizedBox(
        height: 180,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'My Setting',
                style: GoogleFonts.roboto(
                    fontSize: 14, fontWeight: FontWeight.w500, height: 2.4),
              ),
            ),
            ListTile(
              title: Text(
                'Manage My Events',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w400, height: 2.4),
              ),
              trailing: const Icon(Icons.navigate_next),
            ),
            ListTile(
              title: Text(
                'Manage My Conversations',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w400, height: 2.4),
              ),
              trailing: const Icon(Icons.navigate_next),
            )
          ],
        ),
      );
  ElevatedButton logOutButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor, minimumSize: const Size(312, 48)),
        onPressed: () async {
          try {
            await Provider.of<Authentication>(context, listen: false).logOut();
            if (!mounted) return;
            Navigator.pushAndRemoveUntil(
                context,
                RouteAnimate(builder: (context) => const LoginScreen()),
                (route) => false);
          } on FirebaseAuthException catch (e) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(e.message!)));
          }
        },
        child: Text('LOGOUT',
            style: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1)));
  }
}
