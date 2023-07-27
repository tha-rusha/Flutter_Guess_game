import 'package:flutter/material.dart';

class WrongPage extends StatelessWidget {
  const WrongPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Guess Game"),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        backgroundColor: const Color.fromRGBO(255, 205, 210, 1.000),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sorry! wrong guess. Please try again..."),
              const SizedBox(
                height: 30,
              ),
              // go to home page (go back)
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Try Again"))
            ],
          ),
        ));
  }
}
