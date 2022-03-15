import 'package:flutter/material.dart';
import 'package:weather_app/widgets/widgets.dart';
import 'package:weather_app/blocs/blocs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: <Widget>[
          const VerticalDivider(width: 3),
          ArchiveActionPopup(onSelected: (choice) async {
            if (choice == WeatherAction.days) {
              //await widget.storage.uploadArchive(passw);
            } else if (choice == WeatherAction.hours) {
              // var downloadRes =
              //     await widget.storage.downloadArchive(pickedPath, passw);

            }
          }),
          const VerticalDivider(width: 4),
        ],
      ),
      body: Container(),
    );
  }
}
