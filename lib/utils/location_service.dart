import 'package:geolocator/geolocator.dart';

class LocationService {
  // Método para solicitar permisos de ubicación
  Future<bool> requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    // Devuelve true si se concede el permiso, de lo contrario, false
    return permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always;
  }

  // Método para obtener la ubicación actual
  Future<Position?> getCurrentLocation() async {
    // Solicitar permiso de ubicación
    bool hasPermission = await requestLocationPermission();

    if (hasPermission) {
      try {
        // Obtener la posición actual con alta precisión
        return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
      } catch (e) {
        // Manejar excepciones al obtener la ubicación
        print("Error al obtener la ubicación: $e");
        return null;
      }
    } else {
      print("Permiso de ubicación denegado");
      return null;
    }
  }
}
