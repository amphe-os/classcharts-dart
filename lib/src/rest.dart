// rest of classdarts lmao
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

part of classdarts;

class StudentClient{
  int userID;
  String sessionID;
  StudentClient(this.sessionID, this.userID);


  Future<Map> basicInfo() async {
  var dio = Dio();
  dio.options.headers["Authorization"] = "Basic $sessionID";
  Response loginRequest = await dio.get(
    'https://www.classcharts.com/apiv2student/ping',
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );
  assert(loginRequest.data is Map);
  Map<dynamic, dynamic> request = loginRequest.data;
  return request;
}

  Future getBehaviour(String? fromDate, String? toDate) async {
  var dio = Dio();
  dio.options.headers["Authorization"] = "Basic $sessionID";
  if (fromDate ==null && toDate ==null) {
  String url = 'https://www.classcharts.com/apiv2student/behaviour/$userID';
  Response loginRequest = await dio.get(
    url,
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );
  assert(loginRequest.data is Map);
  Map request = (loginRequest.data);
  return(request);
  } else if (fromDate !=null && toDate !=null) {

  String url = 'https://www.classcharts.com/apiv2student/behaviour/$userID?from=$fromDate&to=$toDate';
  Response loginRequest = await dio.get(
    url,
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );
  assert(loginRequest.data is Map);
  Map request = (loginRequest.data);
  return(request);
  }
}
  /// sortBy can be "due_date" "issue_date" defaults to 30 days
  Future getTasks(String sortBy, String? fromDate, String? toDate) async {
  var dio = Dio();
  dio.options.headers["Authorization"] = "Basic $sessionID";
  if (fromDate ==null && toDate ==null) {
  String url = 'https://www.classcharts.com/apiv2student/homeworks/$userID';
  Response loginRequest = await dio.get(
    url,
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );
  assert(loginRequest.data is Map);
  Map request = (loginRequest.data);
  return(request);
  } else if (fromDate !=null && toDate !=null) {

  String url = 'https://www.classcharts.com/apiv2student/homeworks/$userID?display_date=due_date=$sortBy?from=$fromDate&to=$toDate';
  Response loginRequest = await dio.get(
    url,
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );
  assert(loginRequest.data is Map);
  Map request = (loginRequest.data);
  return(request);
  }
}
  // for some REASON, classcharts USES THE SAME COMMAND FOR MARKING DONE AND NOT DONE AND THAT MAKES MY JOB SO MUCH  HARDER I HATE YOU TES i cba honestly
  /// will mark task as done or todo depending on the current tarks type
  Future markTaskDone(int taskID) async {
    var dio = Dio();
    dio.options.headers["Authorization"] = "Basic $sessionID";
  String url = 'https://www.classcharts.com/apiv2student/homeworkticked/$taskID?pupil_id=$userID';
  Response loginRequest = await dio.get(
    url,
    options: Options(contentType: Headers.formUrlEncodedContentType),
  );
  assert(loginRequest.data is Map);
  if (loginRequest.data['success'] == 0) {
    Map request = (loginRequest.data);
    return(request['error']);
  }
  Map request = (loginRequest.data);
  return(request['success']);
    
    
    }
  // done /apiv2student/homeworkticked/254798543?pupil_id=6201286
  // var'ed /apiv2student/homeworkticked/$taskID?pupil_id=$userID
  // response[data][lesson][ticked]

}


