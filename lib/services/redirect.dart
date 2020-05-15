import 'package:flutter/material.dart';
import 'package:morph_app/screens/home/settings.dart';
import 'package:morph_app/screens/home/translator.dart';

class Redirect {
  Future navigateToSettings(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Settings()));
  }

  Future navigateToTranslator(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Morph()));
  }
}
