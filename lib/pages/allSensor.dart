import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class allSensor extends StatefulWidget {
  const allSensor({Key? key}) : super(key: key);

  @override
  State<allSensor> createState() => _allSensorState();
}

class _allSensorState extends State<allSensor> {
  Future getSensorData() async {
    var response = await http.get(Uri.https("", ""));
    var jsonData = jsonDecode(response.body);
    List<Sensor> sensors = [];
    for (var u in jsonData){
      Sensor sensor = Sensor(u["name"]);
      sensors.add(sensor);

    }
    print(sensors.length);
    return sensors;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0095FF),
        title: Text(
          "Pose",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 23,
            letterSpacing: 2,
            color: Colors.white,

          ),
        ),

      ),
      body: Container(
        child: Card(
            child: FutureBuilder(
                future: getSensorData(),
                builder: (context,AsyncSnapshot snapshot){
                  if(snapshot.data == null){
                    return Container(
                      child: Center(
                        child: Text("loading "),
                      ),
                    );

                  }
                  else
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, i){
                          return ListTile(
                           title: Text(snapshot.data[i].name),

                          );
                        }
                    );
                }
            )
        ),
      ),
    );
  }
}

class Sensor{
  final String name;
  Sensor(this.name);
}