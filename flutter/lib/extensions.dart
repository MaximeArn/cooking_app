extension TimerUtils on int {
  String getFormatedTimer() {
    String minuts = "${(this ~/ 60)}".padLeft(2, '0');
    String seconds = "${(this % 60)}".padLeft(2, '0');
    return "$minuts:$seconds";
  }
}
