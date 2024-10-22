class WeatherModel {
  final double latitude;
  final double longitude;
  final double elevation;
  final String timezone;
  final CurrentUnits currentUnits;
  final CurrentWeather current;
  final HourlyUnits hourlyUnits;
  final HourlyWeather hourly;

  WeatherModel({
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.timezone,
    required this.currentUnits,
    required this.current,
    required this.hourlyUnits,
    required this.hourly,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      latitude: json['latitude'],
      longitude: json['longitude'],
      elevation: json['elevation'],
      timezone: json['timezone'],
      currentUnits: CurrentUnits.fromJson(json['current_units']),
      current: CurrentWeather.fromJson(json['current']),
      hourlyUnits: HourlyUnits.fromJson(json['hourly_units']),
      hourly: HourlyWeather.fromJson(json['hourly']),
    );
  }
}

class CurrentUnits {
  final String time;
  final String interval;
  final String temperature;
  final String relativeHumidity;
  final String apparentTemperature;
  final String isDay;
  final String precipitation;
  final String rain;
  final String weatherCode;
  final String windSpeed;

  CurrentUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.relativeHumidity,
    required this.apparentTemperature,
    required this.isDay,
    required this.precipitation,
    required this.rain,
    required this.weatherCode,
    required this.windSpeed,
  });

  factory CurrentUnits.fromJson(Map<String, dynamic> json) {
    return CurrentUnits(
      time: json['time'],
      interval: json['interval'],
      temperature: json['temperature_2m'],
      relativeHumidity: json['relative_humidity_2m'],
      apparentTemperature: json['apparent_temperature'],
      isDay: json['is_day'],
      precipitation: json['precipitation'],
      rain: json['rain'],
      weatherCode: json['weather_code'],
      windSpeed: json['wind_speed_10m'],
    );
  }
}

class CurrentWeather {
  final String time;
  final int interval;
  final double temperature;
  final int relativeHumidity;
  final double apparentTemperature;
  final bool isDay;
  final double precipitation;
  final double rain;
  final int weatherCode;
  final double windSpeed;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.relativeHumidity,
    required this.apparentTemperature,
    required this.isDay,
    required this.precipitation,
    required this.rain,
    required this.weatherCode,
    required this.windSpeed,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'],
      interval: json['interval'],
      temperature: json['temperature_2m'],
      relativeHumidity: json['relative_humidity_2m'],
      apparentTemperature: json['apparent_temperature'],
      isDay: json['is_day'] == 1,
      precipitation: json['precipitation'],
      rain: json['rain'],
      weatherCode: json['weather_code'],
      windSpeed: json['wind_speed_10m'],
    );
  }
}

class HourlyUnits {
  final String time;
  final String temperature;
  final String relativeHumidity;
  final String precipitationProbability;
  final String windSpeed;

  HourlyUnits({
    required this.time,
    required this.temperature,
    required this.relativeHumidity,
    required this.precipitationProbability,
    required this.windSpeed,
  });

  factory HourlyUnits.fromJson(Map<String, dynamic> json) {
    return HourlyUnits(
      time: json['time'],
      temperature: json['temperature_2m'],
      relativeHumidity: json['relative_humidity_2m'],
      precipitationProbability: json['precipitation_probability'],
      windSpeed: json['wind_speed_10m'],
    );
  }
}

class HourlyWeather {
  final List<DateTime> time;
  final List<double> temperature;
  final List<int> relativeHumidity;
  final List<int> precipitationProbability;
  final List<double> windSpeed;
  final List<int> weatherCode;

  HourlyWeather({
    required this.time,
    required this.temperature,
    required this.relativeHumidity,
    required this.precipitationProbability,
    required this.windSpeed,
    required this.weatherCode,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    return HourlyWeather(
      time: List<DateTime>.from(json['time'].map((t) => DateTime.parse(t))),
      temperature: List<double>.from(json['temperature_2m']),
      relativeHumidity: List<int>.from(json['relative_humidity_2m']),
      precipitationProbability:
          List<int>.from(json['precipitation_probability']),
      windSpeed: List<double>.from(json['wind_speed_10m']),
      weatherCode: List<int>.from(json['weather_code']),
    );
  }
}
