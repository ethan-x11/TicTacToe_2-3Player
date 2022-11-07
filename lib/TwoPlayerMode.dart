import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/game_logic.dart';
import 'package:tic_tac_toe/ui/theme/color.dart';
import 'package:tic_tac_toe/textcontrollers.dart';

class PlayerChoice2 extends StatefulWidget {
  const PlayerChoice2({super.key});

  @override
  State<PlayerChoice2> createState() => _PlayerChoice2();
}

class _PlayerChoice2 extends State<PlayerChoice2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Step 2 <- SEE HERE
    name1.text = 'Player1';
    name2.text = 'Player2';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("2 Players"),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.greenAccent[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Enter Players Name",
              style: TextStyle(
                fontFamily: 'monospace',
                color: Color.fromARGB(255, 15, 196, 216),
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: name1,
                autocorrect: true,
                onChanged: (v) {
                  name1.text = v;
                  name1.selection = TextSelection.fromPosition(
                      TextPosition(offset: name1.text.length));
                },
                maxLength: 10,
                decoration: InputDecoration(
                  labelText: 'Player1 Name',
                  hintText: 'Player1',
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      name1.clear();
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                controller: name2,
                autocorrect: true,
                onChanged: (v) {
                  name2.text = v;
                  name2.selection = TextSelection.fromPosition(
                      TextPosition(offset: name2.text.length));
                },
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(Icons.person),
                  labelText: 'Player2 Name',
                  hintText: 'Player2',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      name2.clear();
                    },
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.play_arrow_rounded),
              label: Text("Play"),
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.1),
                  disabledForegroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.4)),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/second');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String lastValue = "X";
  String printline = "";
  bool gameOver = false;
  bool isButttonActive = false;
  int turn = 0;
  List<int> scoreboard = List.filled(8, 0);
  int XWin = 0;
  int YWin = 0;
  String WinVals = "1st Player(X): 0 / 2nd Player(O): 0";

  String playername = name1.text;

  Game game = Game();

  @override
  void initState() {
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
    if (name1.text.isEmpty) {
      name1.text = 'Player1';
    }
    if (name2.text.isEmpty) {
      name2.text = 'Player2';
    }
  }

  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;

    if (turn == 0)
      isButttonActive = false;
    else
      isButttonActive = true;

    if (turn == 0) printline = "It's ${playername}'s Turn";

    String WinVals = "${name1.text}(X): ${XWin} | ${name2.text}(O): ${YWin}";

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tic-Tac-Toe (2 Player)'),
          titleSpacing: 00.0,
          centerTitle: true,
          toolbarOpacity: 0.8,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25)),
          ),
          elevation: 0.00,
        ),
        backgroundColor: MainColor.primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              WinVals,
              style: TextStyle(
                fontFamily: 'curvefont',
                color: Colors.greenAccent[400],
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            FittedBox(
              fit: BoxFit.cover,
              child: Text(
                printline,
                style: TextStyle(
                  fontFamily: 'curvefont',
                  color: Color.fromARGB(255, 15, 196, 216),
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(width: 15, color: Colors.blueAccent),
                borderRadius: BorderRadius.all(Radius.circular(
                        35.0) //                 <--- border radius here
                    ),
              ),
              width: boardWidth,
              height: boardWidth,
              child: GridView.count(
                crossAxisCount: Game.boardlenth ~/ 3,
                padding: EdgeInsets.all(16.0),
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(
                  Game.boardlenth,
                  (index) {
                    return InkWell(
                      onTap: gameOver
                          ? null
                          : () {
                              if (game.board![index] == "") {
                                setState(() {
                                  game.board![index] = lastValue;
                                  turn++;
                                  gameOver = game.winnerCheck(
                                      lastValue, index, scoreboard, 3);
                                  if (gameOver) {
                                    printline = "Winner is $playername";
                                    if (lastValue == "X") {
                                      XWin += 1;
                                    } else {
                                      YWin += 1;
                                    }
                                  } else if (!gameOver && turn == 9) {
                                    printline = "It's a Draw";
                                    gameOver = true;
                                  }
                                  if (!gameOver && turn != 9) {
                                    if (lastValue == "X") {
                                      lastValue = "O";
                                      playername = name2.text;
                                      printline = "It's ${playername}'s Turn";
                                    } else {
                                      lastValue = "X";
                                      playername = name1.text;
                                      printline = "It's ${playername}'s Turn";
                                    }
                                  }
                                });
                              }
                            },
                      child: Container(
                        width: Game.blocSize,
                        height: Game.blocSize,
                        decoration: BoxDecoration(
                          color: MainColor.secondaryColor,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Center(
                          child: Text(
                            game.board![index],
                            style: TextStyle(
                              color: game.board![index] == "X"
                                  ? Colors.blue
                                  : Colors.pink,
                              fontSize: 64.0,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.replay),
              label: Text("Replay"),
              style: ElevatedButton.styleFrom(
                  disabledBackgroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.1),
                  disabledForegroundColor:
                      Color.fromARGB(255, 24, 186, 81).withOpacity(0.4)),
              onPressed: isButttonActive
                  ? () {
                      setState(() {
                        game.board = Game.initGameBoard();
                        lastValue = "X";
                        gameOver = false;
                        turn = 0;
                        scoreboard = [0, 0, 0, 0, 0, 0, 0, 0];
                        isButttonActive = false;
                      });
                    }
                  : null,
            ),
          ],
        ));
  }
}
