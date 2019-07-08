import 'package:flutter/material.dart';
import 'package:tourix/screens/location_detail/location_detail.dart';
import 'screens/locations/locations.dart';
import 'style.dart';

const LocationsRoute = '/';
const LocationDetailRoute = '/location_detail';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _theme(),
    );
  }

  ThemeData _theme() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(title: AppBarTextStyle),
      ),
      textTheme: TextTheme(
        title: TitleTextStyle,
        subtitle: SubTitleTextStyle,
        caption: CaptionTextStyle,
        body1: Body1TextStyle,
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> args = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocatinoDetail(args['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
