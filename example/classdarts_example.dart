import 'package:classdarts/classdarts.dart';

void main() async {
  // var user = UserAuthentication();
  // var session = await user.login("", "/");
  // print(session);
  var student = StudentClient('fuck');
  Map map = await student.basicInfo();
  print(map);

}
