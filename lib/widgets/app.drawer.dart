import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../const.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var name = FirebaseAuth.instance.currentUser;
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.cyan,
                  backgroundImage: NetworkImage(name?.photoURL ?? userIcon),
                  radius: 40,
                ),
                Text(
                  'Welcome ${name?.displayName ?? 'USERNAME'}',
                  style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text(name?.email ?? 'USER EMAIL'),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
