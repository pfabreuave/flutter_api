import 'package:http/http.dart' as http;

/*
    API falsa gratuita para teste e prototipagem.
*/
const baseUrl = 'https://jsonplaceholder.typicode.com';

class API {
  static Future getUsers() async {
    var url = Uri.parse(baseUrl + '/users');
    Uri.parse('url');
    return await http.get(url);
  }
}
