import 'dart:convert';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;

Future<String?> getRandomWord() async {
  try{

    http.Response response = await http.get(
      Uri.parse('https://random-word-api.herokuapp.com/word?length=5')
    );
    if(response.statusCode != 200 || response.body.isEmpty){
      throw Exception('Word not found');
    }

    List<dynamic> results = json.decode(response.body);

    return results[0] as String;
  }
  catch(e){
    developer.log(
      'Error getting random word',
      name: 'api/dictionary',
      error: e
    );
    return null;
  }
}