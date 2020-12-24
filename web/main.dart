import 'dart:html';
import 'package:TextEngine/TextEngine.dart';
import 'dart:async';

void main() async {
  querySelector('#output').appendHtml("<h1>Paradox Birthday Cake Recipie</h1>");

  for(int i = 0; i < 4; i++) {
    DivElement text = await writeBirthdayQuip();
    querySelector('#output').append(text);
  }
  HeadingElement instructions = new HeadingElement.h3();
  instructions.appendText("Directions:");
  querySelector('#output').append(instructions);

  for(int i = 1; i <= 13; i++) {
    DivElement step = await writeCakeStep(i);
    querySelector('#output').append(step);
  }

  querySelector('#output').appendHtml("<br>");
}

Future<DivElement> writeBirthdayQuip() async {
  TextEngine textEngine = new TextEngine();

  TextStory textStory = new TextStory();
  await textEngine.loadList("Birthday");

  String phrase = textEngine.phrase("cake_info");
  DivElement ret = new DivElement();
  ret.appendText(phrase);
  return ret;
}

Future<DivElement> writeCakeStep(int number) async {
  TextEngine textEngine = new TextEngine();

  TextStory textStory = new TextStory();
  await textEngine.loadList("Birthday");

  String phrase = textEngine.phrase("cake_step");
  DivElement ret = new DivElement();
  ret.appendText("$number: ${phrase}");
  return ret;
}