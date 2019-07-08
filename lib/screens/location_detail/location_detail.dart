import 'package:flutter/material.dart';
import 'package:tourix/widgets/location_tile.dart';
import '../../widgets/image_banner.dart';
import 'text_section.dart';
import '../../models/location.dart';

class LocatinoDetail extends StatelessWidget {
  final int _locationID;
  LocatinoDetail(this._locationID);
  @override
  Widget build(BuildContext context) {
    final location = Location.fetchByID(_locationID);

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ImageBanner(assetPath: location.imagePath),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: LocationTile(location: location),
            ),
          ]..addAll(textSections(location)),
        ),
      ),
    );
  }

  List<Widget> textSections(Location location) {
    return location.facts
        .map((fact) => TextSection(fact.title, fact.text))
        .toList();
  }
}
