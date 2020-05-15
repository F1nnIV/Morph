import 'package:http/http.dart';
import 'dart:convert';

class Translation {
  String key =
      "trnsl.1.1.20200512T131109Z.6b76808a08a36544.b5d9b76127c18414dca5354d559a88cdbb88ac5c";
  String lang = "la-de";
  String text = "equus";
  String translation;

  Translation({this.text, this.translation});

  Future<void> getTranslation(textInput) async {
    text = textInput;
    try {
      Response response = await get(
          "https://translate.yandex.net/api/v1.5/tr.json/translate?lang=$lang&key=$key&text=$text");
      Map data = jsonDecode(response.body);
      translation = data["text"][0];
      print(translation);
      print(data);
    } catch (e) {}
  }
}
