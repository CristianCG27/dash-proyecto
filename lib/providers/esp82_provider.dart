import 'package:http/http.dart' as http;

const String espUrl = 'http://192.168.137.198';

Future<void> getStatus() async {
  const url = '$espUrl/conected';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print("Aplicacion conectada");
  } else {
    throw Exception('Error al conectar');
  }
}
