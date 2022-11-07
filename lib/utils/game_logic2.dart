class Player2 {
  static const x = "X";
  static const o = "O";
  static const t = "+";
  static const empty = "";
}

class Game2 {
  static final boardlenth = 16;
  static final blocSize = 100.0;

  List<String> board = List.filled(24, '');

  static List<String> initGameBoard() =>
      List.generate(boardlenth, (index) => Player2.empty);

  bool winnerCheck() {
    // bool i = checkwin(board);
    if (board[0] != '' && board[0] == board[1] && board[1] == board[2])
      return true;
    else if (board[1] != '' && board[1] == board[2] && board[2] == board[3])
      return true;
    else if (board[4] != '' && board[4] == board[5] && board[5] == board[6])
      return true;
    else if (board[5] != '' && board[5] == board[6] && board[6] == board[7])
      return true;
    else if (board[8] != '' && board[8] == board[9] && board[9] == board[10])
      return true;
    else if (board[9] != '' && board[9] == board[10] && board[10] == board[11])
      return true;
    else if (board[12] != '' &&
        board[12] == board[13] &&
        board[13] == board[14])
      return true;
    else if (board[13] != '' &&
        board[13] == board[14] &&
        board[14] == board[15])
      return true;
    else if (board[0] != '' && board[0] == board[4] && board[4] == board[8])
      return true;
    else if (board[4] != '' && board[4] == board[8] && board[8] == board[12])
      return true;
    else if (board[1] != '' && board[1] == board[5] && board[5] == board[9])
      return true;
    else if (board[5] != '' && board[5] == board[9] && board[9] == board[13])
      return true;
    else if (board[2] != '' && board[2] == board[6] && board[6] == board[10])
      return true;
    else if (board[6] != '' && board[6] == board[10] && board[10] == board[14])
      return true;
    else if (board[3] != '' && board[3] == board[7] && board[7] == board[11])
      return true;
    else if (board[7] != '' && board[7] == board[11] && board[11] == board[15])
      return true;
    else if (board[0] != '' && board[0] == board[5] && board[5] == board[10])
      return true;
    else if (board[5] != '' && board[5] == board[10] && board[10] == board[15])
      return true;
    else if (board[3] != '' && board[3] == board[6] && board[6] == board[9])
      return true;
    else if (board[6] != '' && board[6] == board[9] && board[9] == board[12])
      return true;
    else if (board[2] != '' && board[2] == board[5] && board[5] == board[8])
      return true;
    else if (board[7] != '' && board[7] == board[10] && board[10] == board[13])
      return true;
    else if (board[4] != '' && board[4] == board[9] && board[9] == board[14])
      return true;
    else if (board[1] != '' && board[1] == board[6] && board[6] == board[11])
      return true;

    return false;
  }
}
