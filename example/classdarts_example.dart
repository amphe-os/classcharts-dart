import 'dart:io';

import 'package:classdarts/classdarts.dart';

void main() async {
  var user = UserAuthentication();
  Map session = await user.login(null, null);
  print(session);
  if (session.containsKey('ERROR')) {
    print(session['ERROR']);
    exit(1);
  }
  var student = StudentClient(session["sesh"], session["userid"]);
  Map map = await student.basicInfo();
  print(map);

}
