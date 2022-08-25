import 'package:classdarts/classdarts.dart';

void main() async {
  var user = UserAuthentication();
  var session = await user.login(null, null);
  print(session);
  var student = StudentClient(session);
  print(student.basicInfo());
}
