import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class allMachine extends StatefulWidget {
  const allMachine({Key? key}) : super(key: key);

  @override
  State<allMachine> createState() => _allMachineState();
}

class _allMachineState extends State<allMachine> {

  Future getMachineData() async {
    var response = await http.get(Uri.https("", ""));
    var jsonData = jsonDecode(response.body);
    List<Machine> machines = [];
    for (var u in jsonData){
      Machine machine = Machine(u["name"]);
      machines.add(machine);

    }
     print(machines.length);
    return machines;

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
                future: getMachineData(),
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
                        itemCount:snapshot.data!.length,
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
class Machine{
  final String name;
  Machine( this.name);
}
