import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:geocoding/geocoding.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_app2/domain/model/weather_model.dart';
import 'package:weather_app2/presentation/pages/details/details_page.dart';
import 'package:weather_app2/utils/location_service.dart';
import 'package:weather_app2/utils/weather_service.dart';
import 'package:weather_app2/utils/weather_utils.dart';
import 'package:weather_app2/widgets/itemList_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _locationService = LocationService();
  final _weatherService = WeatherService();
  WeatherModel? weatherData;
  String _locationName = "ubicacion ";

  @override
  void initState() {
    _init();
    super.initState();
  }

  Future<void> _init() async {
    final permission = await _locationService.requestLocationPermission();
    if (permission) {
      _getData();
    }
  }

  Future<void> _getData() async {
    final ubication = await _locationService.getCurrentLocation();

    if (ubication != null) {
      final data = await _weatherService.getWeatherData(
          ubication.latitude, ubication.longitude);

      List<Placemark> placemarks = await placemarkFromCoordinates(
        ubication.latitude,
        ubication.longitude,
      );

      if (data != null) {
        setState(() {
          weatherData = WeatherModel.fromJson(data);
          _locationName = placemarks.first.locality ?? "Ubicación ";
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final data = weatherData;
    return Scaffold(
      backgroundColor: weatherData?.current.isDay == true
          ? const Color.fromARGB(255, 146, 184, 255)
          : const Color.fromARGB(255, 28, 16, 56),
      body: SafeArea(
        child: data == null ? _loading() : _body(context, data),
      ),
    );
  }

  Center _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Color getTextColor(bool isDay) {
    return isDay ? Colors.black : Colors.white;
  }

  Padding _body(BuildContext context, WeatherModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          _appbar(),
          _greeting(data),
          _nameLocation(data),
          _dayAndNight(data),
          _weatherConditions(
            data,
          ),
          const SizedBox(height: 15),
          _todayWeather(context),
          _list()
        ],
      ),
    );
  }

  Widget _todayWeather(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _today(),
        _arrowButton(context),
      ],
    );
  }

  Widget _arrowButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const DetailsPage(),
        //   ),
        // );
      },
      icon: Icon(
        Icons.arrow_forward,
        color: _colorsDay(),
      ),
    );
  }

  Widget _today() {
    return Text(
      "Today",
      style: TextStyle(
        color: _colorsDay(),
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _weatherConditions(
    WeatherModel data,
  ) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: data.current.isDay == true
            ? const LinearGradient(
                colors: [
                  Color.fromARGB(255, 31, 140, 213),
                  Color.fromARGB(255, 152, 188, 242),
                  Color.fromARGB(255, 57, 113, 217),
                ],
              )
            : LinearGradient(
                colors: [
                  Colors.pink,
                  Colors.purple,
                  Colors.deepPurpleAccent.shade700,
                ],
              ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _weatherCondition(
              climaticVariable: "Viento",
              dataClimaticVariable: data.current.windSpeed.toString(),
              variableSymbol: "km/h"),
          _weatherCondition(
              climaticVariable: "Temperatura",
              dataClimaticVariable: data.current.temperature.toString(),
              variableSymbol: "°c"),
          _weatherCondition(
              climaticVariable: "humedad",
              dataClimaticVariable: data.current.relativeHumidity.toString(),
              variableSymbol: "%")
        ],
      ),
    );
  }

  Widget _nameLocation(WeatherModel data) {
    final imageDay = data.current.isDay
        ? 'assets/lottie/clear-day.json'
        : 'assets/lottie/clear-night.json';
    return Row(
      children: [
        Text(
          _locationName,
          style: TextStyle(
            color: _colorsDay(),
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        Lottie.asset(imageDay, width: 30, height: 30),
      ],
    );
  }

  Widget _greeting(WeatherModel data) {
    final greetin = data.current.isDay ? 'Buenos dias' : 'Buenas noches';
    return Row(
      children: [
        Text(
          greetin,
          style: TextStyle(
            color: _colorsDay(),
            fontSize: 15,
          ),
        ),
      ],
    );
  }

  Widget _appbar() {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconLocation(),
          _location(),
          _serchButton(),
        ],
      ),
    );
  }

  Widget _iconLocation() => Icon(Icons.my_location, color: _colorsDay());

  Widget _serchButton() {
    return IconButton(
      onPressed: () {
        _getData();
      },
      icon: Icon(
        Icons.search,
        color: _colorsDay(),
      ),
    );
  }

  Widget _location() {
    return Text(
      _locationName,
      style: TextStyle(
        color: _colorsDay(),
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Color _colorsDay() => getTextColor(weatherData?.current.isDay == true);

  Widget _dayAndNight(WeatherModel data) {
    final image = WeatherUtils.getWeatherImage(
        data.current.weatherCode, data.current.isDay);

    return Column(
      children: [
        Lottie.asset(
          image,
          height: 300,
        ),
      ],
    );
  }

  Widget _list() {
    final dataList = weatherData;
    return Expanded(
      child: dataList == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _listView(dataList),
    );
  }

  Padding _listView(WeatherModel weatherData) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 30),
      child: ListView.builder(
        itemCount: weatherData.hourly.time.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          var date = weatherData.hourly.time[index];
          var temperature = weatherData.hourly.temperature[index];
          var weatherCode = weatherData.hourly.weatherCode[index];
          var formattedTime =
              DateFormat.jm().format(DateTime.parse(date.toString()));
          DateTime seisAM = DateTime(date.year, date.month, date.day, 5);
          DateTime seisPM = DateTime(date.year, date.month, date.day, 19, 0);
          var isDay = date.isAfter(seisAM) && date.isBefore(seisPM);

          return ItemListWidget(
            time: formattedTime,
            temperature: temperature,
            weatherCode: weatherCode,
            isDay: isDay,
            dataDay: weatherData,
          );
        },
      ),
    );
  }

  Column _weatherCondition(
      {required String climaticVariable,
      required String dataClimaticVariable,
      required String variableSymbol}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children: [
            Text(
              climaticVariable,
              style: TextStyle(
                  color: _colorsDay(),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              dataClimaticVariable.toString(),
              style: TextStyle(
                color: _colorsDay(),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              variableSymbol,
              style: TextStyle(
                color: _colorsDay(),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        )
      ],
    );
  }
}
