import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morph_app/components/my_app_bar.dart';
import 'package:morph_app/services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:morph_app/services/redirect.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

final Redirect _navigate = Redirect();

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: TopBar(
        onPressed: () {
          _navigate.navigateToSettings(context);
        },
        onPressed2: () {
          _navigate.navigateToTranslator(context);
        },
      ),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 110.0,
          ),
          Center(
            child: Text(
              "Hello User!",
              style: GoogleFonts.poppins(
                  textStyle:
                      TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }
}
