class Failure {
  int code; // 200 or 400
  String message; // failure or success

  Failure(this.code, this.message);
}