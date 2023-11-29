import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TranslationApp(),
    );
  }
}

class TranslationApp extends StatefulWidget {
  const TranslationApp({Key? key}) : super(key: key);

  @override
  _TranslationAppState createState() => _TranslationAppState();
}

class _TranslationAppState extends State<TranslationApp> {
  List<String> phrasesList = [
    'Neatza',
    'おはよう',
    'Încântat de cunoştinţă',
    'どうぞ、よろしく',
    'Mulțumesc',
    'ありがとう',
    'La revedere',
    'さようなら',
  ];

  AudioPlayer audioPlayer = AudioPlayer();

  void playAudio(int index) {
    audioPlayer.play('res/basic_phrases/$index.mp3', isLocal: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Basic Phrases',
            style: TextStyle(fontSize: 36, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.pink[800],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: phrasesList.length,
        itemBuilder: (context, index) {
          int phraseIndex = index + 1;

          return GestureDetector(
            onTap: () {
              playAudio(phraseIndex);
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: LinearGradient(
                    colors: [Colors.pink[500]!, Colors.pink[800]!],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    phrasesList[index],
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
