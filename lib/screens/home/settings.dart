import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morph_app/components/my_app_bar.dart';

import 'package:morph_app/services/auth.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(),
      body: Column(
        children: <Widget>[
          Text(
            "Settings",
            style: GoogleFonts.poppins(
                textStyle:
                    TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
          ),
          Center(
            child: FlatButton(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: Colors.red)),
              child: Text("Log Out",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.red)),
              onPressed: () async {
                await _auth.signOut();
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
