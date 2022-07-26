import 'dart:developer' as developer;

Future<String?> getRandomWord() async {
  try{
    return 'check';
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