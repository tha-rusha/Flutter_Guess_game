import 'package:flutter/material.dart';
import 'package:guess_game/pages/home_page.dart';

class CorrectGuess extends StatelessWidget {
  const CorrectGuess({Key? key, required this.correctNumber}) : super(key: key);

  final int correctNumber;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Guess Game"),
            automaticallyImplyLeading: false,
          ),
          backgroundColor: const Color.fromRGBO(200, 230, 201, 1.000),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Yes! you guessed it right. My secret number is"),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  correctNumber.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
                      //go to the home page (pushReplacement)
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text("Start the Game Again"))
              ],
            ),
          )),
    );
  }
}
