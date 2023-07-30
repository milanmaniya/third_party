import 'package:fluttertoast/fluttertoast.dart';

class CommonToast {
  void displayToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      toastLength: Toast.LENGTH_SHORT,
      fontSize: 16,
    );
  }
}
