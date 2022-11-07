import 'package:flutter/material.dart';
import 'package:tic_tac_toe/HomeScreen.dart';
import 'package:tic_tac_toe/TwoPlayerMode.dart';
import 'package:tic_tac_toe/ThreePlayerMode.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MaterialApp(
    home: AnimatedSplashScreen(
        splash: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.grid_3x3_rounded, size: 50, color: Colors.white),
              Container(
                child: Text(
                  'Tic Tac Toe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color.fromARGB(255, 196, 228, 218),
        // nextScreen: HomeRoute()),
        nextScreen: HomeRoute()),
    initialRoute: '/',
    routes: {
      '/home': (context) => const HomeRoute(),
      '/playerChoice2': (context) => const PlayerChoice2(),
      '/playerChoice3': (context) => const PlayerChoice3(),
      '/second': (context) => const SecondRoute(),
      '/third': (context) => const ThirdRoute(),
    },
  ));
}
