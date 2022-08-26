// sub-component of classdarts to handle basic authentication and encryption
// can also dump all user data and store it for offline use (in a enviroment like school where the user may not have acsess to internet)
// Copyright (C) 2022 Jack Polanczuk & Amphe Co.

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.

// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see <https://www.gnu.org/licenses/>.

//import 'package:pretty_dio_logger/pretty_dio_logger.dart';
//import 'dart:convert';
part of classdarts;
// void main() async {
//   var url = Uri.parse("https://www.classcharts.com/student/login/");
//   print(url);
//   var res = await http.post(
//     url,
//     headers: {
//       'Accept': 'application/json',
//       'Content-Type': 'application/x-www-form-urlencoded'
//     },
//     body: {
//       '_method': 'POST',
//       'code': 'ghdfkhgkg',
//       'dob': '6/9/1984',
//       'remember_me': '1'
//     },
//   );
//   if (res.statusCode != 200) {
//     throw Exception('http.post error: statusCode= ${res.statusCode}');
//   }
//   print(res.body);
// }

class UserAuthentication {
  Future login(studentCode, dob) async {
    var dio = Dio();
    Response loginRequest = await dio.post(
      'https://www.classcharts.com/apiv2student/login',
      data: {
        '_method': 'POST',
        'code': '$studentCode',
        'dob': '$dob',
        'remember_me': '0',
        'recaptcha-token': 'no-token-available',
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    assert(loginRequest.data is Map);
    // print(loginRequest.data);
    Map apiResponse = loginRequest.data;
    try {
      Map metaResponse = apiResponse['meta'];
    } on TypeError {return {'ERROR': "TYPE PROVIDED IS INVALID, PRESUMED INCORRECT DETAILS"};} 
      
      
    
    Map metaResponse = apiResponse['meta'];

    String sessionID = metaResponse['session_id'];
    
      dio.options.headers["Authorization"] = "Basic $sessionID";
  Response userIDrequest = await dio.get(
    'https://www.classcharts.com/apiv2student/ping',
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );
  assert(userIDrequest.data is Map);
  var userID = await userIDrequest.data["data"]["meta"]["id"];
  if (userID == null) {
    Map details = {'ERROR': "userID is equal to null, login failed"};
    return details;
  }

   var details = {'sesh': sessionID, 'userid': userID};
    return details;
  }
}

// void main() async {
//   var dio = Dio();
//   // dio.interceptors.add(PrettyDioLogger(
//   //     requestHeader: true,
//   //     requestBody: true,
//   //     responseBody: true,
//   //     responseHeader: false,
//   //     error: true,
//   //     compact: true,
//   //     maxWidth: 90));
//   Response loginRequest = await dio.post(
//     'https://www.classcharts.com/apiv2student/login',
//     data: {
//       '_method': 'POST',
//       'code': 'gerghdkjfg',
//       'dob': '6/9/1984',
//       'remember_me': '0',
//       'recaptcha-token': 'no-token-available',
//     },
//     options: Options(contentType: Headers.formUrlEncodedContentType),
//   );
//   assert(loginRequest.data is Map);
//   // print(loginRequest.data);
//   Map apiResponse = loginRequest.data;

//   print(sessionID);
// }
