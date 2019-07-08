import 'package:flutter/material.dart';
import '../../app.dart';
import '../../models/location.dart';
import '../../widgets/image_banner.dart';
import 'tile_overlay.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();
    return Scaffold(
      appBar: AppBar(
        title: Text('Locations'),
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) =>
            _itemBuilder(context, locations[index]),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, Location location) {
    return GestureDetector(
      child: Container(
        height: 245.0,
        child: Stack(
          children: <Widget>[
            ImageBanner(assetPath: location.imagePath, height: 245.0),
            TileOverlay(location),
          ],
        ),
      ),
      onTap: () => _onLocationTap(context, location.id),
    );
  }

  void _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}
