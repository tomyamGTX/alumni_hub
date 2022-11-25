import 'package:alumni_hub/const.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: TextField(
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Type to search ...',
                hintStyle:
                    GoogleFonts.roboto(color: Colors.white, fontSize: 20)),
          ),
          backgroundColor: kPrimaryColor,
        ),
        body: Container());
  }
}
