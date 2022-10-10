extension TimerUtils on int {
  String getFormatedTimer() {
    String minuts = "${(this ~/ 60)}".padLeft(2, '0');
    String seconds = "${(this % 60)}".padLeft(2, '0');
    return "$minuts:$seconds";
  }
}

extension LogUtils on String {
  String toRedLog() => "'\x1B[31m$this\x1B[0m'";
  String toGreenLog() => "'\x1B[32m$this\x1B[0m'";
  String toYellowLog() => "'\x1B[33m$this\x1B[0m'";
  String toBlueLog() => "'\x1B[34m$this\x1B[0m'";
}

