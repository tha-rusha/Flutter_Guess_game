import 'package:flutter/material.dart';
import 'package:guess_game/pages/home_page.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({super.key, required this.secretNumber});

  final int secretNumber;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          backgroundColor: const Color.fromRGBO(187, 222, 251, 1.000),
          appBar: AppBar(
            title: const Text("Guess Game"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Sorry Game Over. my secret number is"),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  secretNumber.toString(),
                  style: const TextStyle(fontSize: 30),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: () {
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
