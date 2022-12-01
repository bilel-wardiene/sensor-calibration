import 'package:flutter/material.dart';
//import 'package:pose/pages//login.dart';
import 'package:pose/pages/allMachine.dart';
import 'package:pose/pages/allSensor.dart';



class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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

      body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child:Column(
          children: [
            Text("Hello in the admin area",
              style: TextStyle(fontSize: 25,color: Colors.grey[800],letterSpacing: 1.5),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/admin.png")

                  )
              ),
            ),

          ],
        )




      ),

    );
  }


}
