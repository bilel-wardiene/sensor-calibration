import 'package:flutter/material.dart';
import 'package:pose/pages/allMachine.dart';
import 'package:pose/pages/allSensor.dart';
import 'package:pose/services/api_service.dart';
import 'package:pose/services/shared_service.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pose'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            onPressed: () {
              SharedService.logout(context);
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      drawer: Drawer(

        child: Container(
          color: Color(0xff0095FF),
          child: ListView(
            children: [
              const DrawerHeader(
                margin: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Center(
                  child: CircleAvatar(
                      radius: 100,
                      backgroundImage: AssetImage("assets/Industry.jpg")
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),

              ListTile(
                leading: Icon(Icons.factory,color: Colors.white),
                title: const Text(
                  'List of machines',
                  style: TextStyle(fontSize: 20,
                      color: Colors.white
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> allMachine()));

                },
              ),
              ListTile(
                leading: Icon(Icons.sensors,color: Colors.white),
                title: const Text(
                  'List of sensors',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> allSensor()));

                },
              ),
              SizedBox(height: 15,),
              ListTile(
                leading: Icon(Icons.logout,color: Colors.white),
                title: const Text(
                  "Logout",
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=> login()));

                },
              )

            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[200],
      body: userProfile(),
    );
  }

  Widget userProfile() {
    return FutureBuilder(
      future: APIService.getUserProfile(),
      builder: (
        BuildContext context,
        AsyncSnapshot<String> model,
      ) {
        if (model.hasData) {
          return Center(child: Text(model.data!));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
