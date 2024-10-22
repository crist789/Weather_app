class WeatherUtils {
  static String getWeatherImage(int weatherCode, bool isDay) {
    switch (weatherCode) {
      case 0:
        return isDay
            ? 'assets/lottie/clear-day.json'
            : 'assets/lottie/clear-night.json';
      case 1:
        return isDay
            ? 'assets/lottie/haze-day.json'
            : 'assets/lottie/haze-night.json';
      case 2:
        return isDay
            ? 'assets/lottie/overcast-day.json'
            : 'assets/lottie/overcast-night.json';
      case 3:
        return 'assets/lottie/overcast.json';

      case 45:
        return isDay
            ? 'assets/lottie/fog-day.json'
            : 'assets/lottie/fog-night.json';
      case 48:
        return 'assets/lottie/overcast-haze.json';
      case 51:
      case 53:
        return isDay
            ? 'assets/lottie/partly-cloudy-day-drizzle.json'
            : 'assets/lottie/partly-cloudy-night-drizzle.json';
      case 55:
        return isDay
            ? 'assets/lottie/partly-cloudy-day-rain.json'
            : 'assets/lottie/partly-cloudy-night-rain.json';
      case 56:
      case 57:
        return isDay
            ? 'assets/lottie/partly-cloudy-day-sleet.json'
            : 'assets/lottie/partly-cloudy-night-sleet.json';
      case 61:
        return isDay
            ? 'assets/lottie/overcast-day-drizzle.json'
            : 'assets/lottie/overcast-night-drizzle.json';
      case 63:
      case 65:
        return isDay
            ? 'assets/lottie/overcast-day-rain.json'
            : 'assets/lottie/overcast-night-rain.json';
      case 66:
      case 67:
        return isDay
            ? 'assets/lottie/overcast-day-sleet.json'
            : 'assets/lottie/overcast-night-sleet.json';
      case 71:
      case 73:
      case 75:
      case 77:
        return isDay
            ? 'assets/lottie/partly-cloudy-day-snow.json'
            : 'assets/lottie/partly-cloudy-night-snow.json';

      case 80:
      case 81:
        return isDay
            ? 'assets/lottie/extreme-day-drizzle.json'
            : 'assets/lottie/extreme-night-drizzle.json';
      case 82:
        return isDay
            ? 'assets/lottie/extreme-day-rain.json'
            : 'assets/lottie/extreme-night-rain.json';
      case 85:
        return isDay
            ? 'assets/lottie/overcast-day-snow.json'
            : 'assets/lottie/overcast-night-snow.json';
      case 86:
        return isDay
            ? 'assets/lottie/extreme-day-snow.json'
            : 'assets/lottie/extreme-night-snow.json';
      case 95:
        return isDay
            ? 'assets/lottie/thunderstorms-day-overcast-rain.json'
            : 'assets/lottie/thunderstorms-night-overcast-rain.json';
      case 96:
        return isDay
            ? 'assets/lottie/thunderstorms-day-extreme-rain.json'
            : 'assets/lottie/thunderstorms-night-extreme-rain.json';
      case 99:
        return isDay
            ? 'assets/lottie/thunderstorms-day-extreme-snow.json'
            : 'assets/lottie/thunderstorms-night-extreme-snow.json';
      default:
        return isDay
            ? 'assets/lottie/clear-day.json'
            : 'assets/lottie/clear-night.json';
    }
  }
}
