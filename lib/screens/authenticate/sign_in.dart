import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:morph_app/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          flexibleSpace: Container(
            padding: EdgeInsets.only(top: 55.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Image.asset(
                  "assets/logo.png",
                  width: 53.0,
                ),
                Text("Morph",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontSize: 36.0, fontWeight: FontWeight.w600),
                    ))
              ],
            ),
          ),
        ),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(5, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration:
                          buildInputDecoration().copyWith(hintText: "Email"),
                      validator: (value) =>
                          value.isEmpty ? "Enter an Email" : null,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 55.0),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(5, 10), // changes position of shadow
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration:
                          buildInputDecoration().copyWith(hintText: "Password"),
                      validator: (value) => value.length < 6
                          ? "Your password must be 6+ charachters long"
                          : null,
                      obscureText: true,
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 43.0),
                  FlatButton(
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
                    color: Color.fromRGBO(91, 36, 178, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Text("Log In",
                        style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        print("object");
                        dynamic result =
                            _auth.signInWithEmailAndPassword(email, password);
                        if (result == null) {
                          setState(() {
                            error = "Could not sign in with those credentials";
                          });
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                  FlatButton.icon(
                      onPressed: () {
                        widget.toggleView();
                      },
                      icon: Icon(Icons.person),
                      label: Text("Register")),
                ],
              ))),
    );
  }

  InputDecoration buildInputDecoration() {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(50.0),
          ),
        ),
        // hintText: "email",
        hintStyle: TextStyle(
            color: Colors.grey, fontSize: 20.0, fontWeight: FontWeight.w500));
  }
}
