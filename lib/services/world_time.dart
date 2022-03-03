import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class WorldTime {
  String location; //location name for the UI
  String? time; //time in that location
  String flag; //url to an asset flag icon
  String url; //location url for api endpoint
  bool isDaytime = true; //true or false if day time or not

  WorldTime({ required this.location, required this.flag, required  this.url });

  Future<void> getTime() async {

    try {
      //make the request
     // http.Response
     var response = await http.get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
     Map data =convert.jsonDecode(response.body);
     //print(data);
     // print(response.body);

      // // get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1,3);
      // //print(datetime);
      // // print(offset);
      //
      // //create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      //
      // //set time property
     //time = now.DateFormat.jm().format(now);
     //time = now.year.toString();
     isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = '${now.hour.toString()}:${now.minute.toString()}';

    }
     catch(e) {
      print('caught error: $e');
      time = 'could not get time';
    }
  }
}
