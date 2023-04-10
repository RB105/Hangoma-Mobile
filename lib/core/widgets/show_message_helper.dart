import 'package:fluttertoast/fluttertoast.dart';

Future<bool?> showMessageHelper(String msg) {
  return Fluttertoast.showToast(msg: msg);
}
