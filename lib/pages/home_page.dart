import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guess_game/pages/correct_page.dart';
import 'package:guess_game/pages/game_over_page.dart';
import 'package:guess_game/pages/wrong_guess_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int _secretNumber = 0;
int _guessesRemaining = 3;
int _chancesTaken = 0;
int counter = 1;

String _enteredText = "";
int _enterdTextLength = 0;

TextEditingController userInput = TextEditingController();

class _HomePageState extends State<HomePage> {
  void _generateSecretNumber() {
    final random = Random();
    _secretNumber = random.nextInt(10) + 1;
    print("Secret Number : $_secretNumber");
  }

  void _checkGuess() {
    int? guessedNumber = int.tryParse(userInput.text);
    if (guessedNumber != null) {
      if (guessedNumber == _secretNumber) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => CorrectGuess(correctNumber: _secretNumber),
          ),
        );
      } else {
        setState(() {
          _guessesRemaining--;
          _chancesTaken++;
        });
        if (_guessesRemaining == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => GameOverPage(
                secretNumber: _secretNumber,
              ),
            ),
          );
        } else {
          userInput.clear();
          _enterdTextLength = 0;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WrongPage(),
            ),
          );
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _generateSecretNumber();
    _guessesRemaining = 3;
    _chancesTaken = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Guess Game"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/search.png'),
              const Text(
                "I have a secret nmber in my mind. Can you geuss it? (1 - 10). You have 3 chances to guess it. Can you guess it?",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Text('$_chancesTaken of 3 chances are taken'),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextField(
                  controller: userInput,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                  ],
                  maxLength: 2,
                  onChanged: (value) {
                    setState(() {
                      _enterdTextLength = value.length;
                    });
                    setState(() {
                      if (int.parse(value) > 10) {
                        userInput.clear();
                        _enterdTextLength = 0;
                      }
                      _enteredText = value;
                    });
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      counterText: '${_enterdTextLength.toString()} /2',
                      counterStyle: const TextStyle(fontSize: 20)),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    _checkGuess();
                    userInput.clear();
                    _enterdTextLength = 0;
                    counter++;
                    if (counter > 3) {}
                    {}
                  },
                  child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
