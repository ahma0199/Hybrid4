import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  try {
    var uri = Uri.parse('https://random-data-api.com/api/users/random_user?size=10');
    final response = await http.get(uri);


    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      if (jsonData is List) {
        for (var user in jsonData) {
          var uid = user['uid'];
          var firstName = user['first_name'];
          var lastName = user['last_name'];
          print('UID: $uid, Name: $firstName $lastName');
        }
      } 
    } else {
      print('Failed to load user data: ${response.statusCode}');
    }
  } catch (err) {
    print('Error: $err');
  }
}
