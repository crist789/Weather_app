import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app2/domain/model/weather_model.dart';
import 'package:weather_app2/utils/weather_utils.dart';

class ItemListWidget extends StatelessWidget {
  final String time;
  final double temperature;
  final int weatherCode;
  final bool isDay;
  final WeatherModel dataDay;

  const ItemListWidget({
    super.key,
    required this.time,
    required this.temperature,
    required this.weatherCode,
    required this.isDay,
    required this.dataDay,
  });

  Color _colorsDay() {
    return dataDay.current.isDay ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 5),
      width: 90,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: dataDay.current.isDay == true
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 31, 140, 213),
                  Color.fromARGB(255, 57, 113, 217),
                ],
              )
            : LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.pink,
                  Colors.purple,
                  Colors.deepPurpleAccent.shade700,
                ],
              ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _timeInHours(),
          _weatherConditionImage(),
          _temperatureperhour(),
        ],
      ),
    );
  }

  Widget _temperatureperhour() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          temperature.toString(),
          style: TextStyle(
            color: _colorsDay(),
            fontSize: 15,
          ),
        ),
        Text(
          "°c",
          style: TextStyle(
            color: _colorsDay(),
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _weatherConditionImage() {
    final image = WeatherUtils.getWeatherImage(weatherCode, isDay);
    return Lottie.asset(image);
  }

  Widget _timeInHours() {
    return Text(
      time,
      style: TextStyle(
        color: _colorsDay(),
        fontSize: 15,
      ),
    );
  }
}
