import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morph_app/services/redirect.dart';

final Redirect _navigate = Redirect();

class TopBar extends AppBar {
  @override
  final GestureTapCallback onPressed;
  final GestureTapCallback onPressed2;
  TopBar({Key key, this.onPressed, this.onPressed2})
      : super(
          key: key,
          leading: Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Image.asset("assets/logo.png"),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 18),
              child: Text("Username",
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 18))),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  onPressed: onPressed),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: IconButton(
                  icon: Icon(
                    Icons.person,
                    color: Colors.black,
                  ),
                  onPressed: onPressed2),
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        );
}
