import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  // Función para obtener el clima por coordenadas
  Future<Map<String, dynamic>?> getWeatherData(
      double latitude, double longitude) async {
    final url =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&current=temperature_2m,relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,weather_code,wind_speed_10m&hourly=temperature_2m,relative_humidity_2m,precipitation_probability,weather_code,wind_speed_10m&timezone=auto";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decodifica el JSON y regresa los datos como un mapa
        return jsonDecode(response.body);
      } else {
        print('Error al obtener los datos: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
      return null;
    }
  }

  // Función para obtener el clima por
}
