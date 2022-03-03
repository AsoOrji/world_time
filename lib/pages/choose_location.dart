import 'package:flutter/material.dart';
import 'package:world_time/services//world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

List<WorldTime> locations = [
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.jpg'),
  WorldTime(url: 'Africa/Lagos', location: 'Nigeria', flag: 'nigeria.jpg'),
  WorldTime(url: 'America/New York', location: 'New York', flag: 'us.jpg'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.jpg'),
  WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.jpg'),
  WorldTime(url: 'Europe/Berlin', location: 'Berlin ', flag: 'germany.jpg'),
];

void updateTime(index) async {
  WorldTime instance = locations[index];
  await instance.getTime();
  //navigate to home screen
  // Navigator.pop(context, {
  //   'location': instance.location,
  //   'flag': instance.flag,
  //   'time': instance.time,
  //   'isDaytime': instance.isDaytime
  // });
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Locatiofn'),
        centerTitle: true,
        elevation: 0,
      ),body: ListView.builder(
      itemCount: locations.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
          child: Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              )
            )
          ),
        );
      },
    )
    );
  }
}

