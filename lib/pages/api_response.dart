class ApiReponse<T> {
  bool ok;
  String msg;
  T result;

  ApiReponse.ok(this.result) {
    ok = true;
  }

  ApiReponse.error(this.msg) {
    ok = false;
  }
}