import 'dart:convert';
import 'package:http/http.dart' as http;

String token ='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0Y2Y1ZDVmMi03YmQ4LTRlOGUtYmM1ZC04YWYxYTBlM2I1NTQiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY1MzA0ODMzMCwiZXhwIjoxNjUzNjUzMTMwfQ.SS_h3QaMCh1mcRhurur33zVf98szHMO5rQWCvvSraCo';

Future<String> createMeeting() async {
  var headers = {
  'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI0Y2Y1ZDVmMi03YmQ4LTRlOGUtYmM1ZC04YWYxYTBlM2I1NTQiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY1MzA1MzY4NiwiZXhwIjoxNjUzNjU4NDg2fQ.D5EAW6WoH_EjFAK9oCyP-AYO5Lze7ZHBZMINFLpfQpk'
};
var request = http.Request('POST', Uri.parse('https://api.videosdk.live/v1/meetings'));

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

if (response.statusCode == 200) {
  print(await response.stream.bytesToString());
  String meetingId=  json.decode(request.body)['meetingId'];

  return meetingId;
}
else {
  print(response.reasonPhrase);
  return '';
}
  // final http.Response httpResponse = await http.post(
  //   Uri.parse("http://api.videosdk.live/v1/meetings"),
  //   headers: {'Authorization': token},
  //   body: jsonEncode('body')
  // );
  // print(httpResponse.toString());
  
  // String meetingId=  json.decode(httpResponse.body)['meetingId'];
  // print('!!!!!! $meetingId');
}