import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Favourites',
          style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Container(),
    );
  }
}
