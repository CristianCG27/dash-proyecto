import 'package:http/http.dart' as http;

const String espUrl = 'http://mi-esp.local';

Future<void> getStatus() async {
  const url = '$espUrl/conected';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    print("Aplicacion conectada");
  } else {
    throw Exception('Error al conectar');
  }
}

Future<void> turnOnLed(int timeInMillis) async {
    final url = '$espUrl/on?time=$timeInMillis'; // Construir la URL completa
    //final url = '$espUrl/posicionX?posicion=$timeInMillis'; // Construir la URL completa

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('LED encendido con éxito');
        print('Respuesta del servidor: ${response.body}');
      } else {
        print('Error en la solicitud: Código ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }

  Future<void> turnOnPx(int position) async {
    final url = '$espUrl/positionx?position=$position'; // Construir la URL completa
    //final url = '$espUrl/posicionX?posicion=$timeInMillis'; // Construir la URL completa

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        print('LED encendido con éxito');
        print('Respuesta del servidor: ${response.body}');
      } else {
        print('Error en la solicitud: Código ${response.statusCode}');
      }
    } catch (e) {
      print('Error de conexión: $e');
    }
  }


