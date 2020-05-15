import 'package:flutter/material.dart';
import 'package:morph_app/components/my_app_bar.dart';
import 'package:morph_app/services/api.dart';
import 'package:morph_app/services/redirect.dart';

final Redirect _navigate = Redirect();

class Morph extends StatefulWidget {
  @override
  _MorphState createState() => _MorphState();
}

class _MorphState extends State<Morph> {
  String translation = " ";
  Translation instance = Translation();
  void setupTranslation(textInput) async {
    await instance.getTranslation(textInput);
    setState(() {
      translation = instance.translation;
    });
    print(translation);
  }

  String textInput = " ";
  var _controller = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        onPressed: () {
          _navigate.navigateToSettings(context);
        },
        onPressed2: () {
          _navigate.navigateToTranslator(context);
        },
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _controller,
                onChanged: (value) {
                  setState(() {
                    textInput = value;
                  });
                },
              ),
              FloatingActionButton(
                onPressed: () {
                  setupTranslation(textInput);
                  setState(() {
                    textInput = "";
                    _controller.clear();
                  });
                },
              ),
              Text(translation)
            ],
          ),
        ),
      ),
    );
  }
}
