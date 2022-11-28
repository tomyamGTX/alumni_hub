import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var _value = false;

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

  Container buildReminder() => Container(
        height: 160,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
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
  Container buildMySetting() => Container(
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
            ),
            ListTile(
              title: Text(
                'Manage My Conversations',
                style: GoogleFonts.roboto(
                    fontSize: 16, fontWeight: FontWeight.w400, height: 2.4),
              ),
            )
          ],
        ),
      );
  ElevatedButton logOutButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor, minimumSize: Size(312, 48)),
        onPressed: () {},
        child: Text('LOGOUT',
            style: GoogleFonts.roboto(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1)));
  }
}
