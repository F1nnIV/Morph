import 'package:flutter/material.dart';
import 'package:morph_app/models/user.dart';
import 'package:morph_app/screens/wrapper.dart';
import 'package:morph_app/services/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(primaryColor: Color.fromRGBO(91, 36, 178, 1)),
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
