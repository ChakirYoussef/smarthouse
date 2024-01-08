import 'package:flutter/material.dart';
import 'smart_device_box.dart';
import '/myDrawer.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  // padding constants
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  // list of smart devices
  List mySmartDevices = [
    // [ smartDeviceName, iconPath , powerStatus ]
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
    ["Garage Door", "lib/icons/garagedoor.png", false],

  ];

  // power button switched
  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: MyDrawer(),
        appBar: AppBar(
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          backgroundColor: Colors.grey[500],
          actions: [
            TextButton(

                onPressed: () {},
                child: Text(
                  "Rooms",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )),
            TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.grey[300] as Color),
                ),
                onPressed: () {},
                child: Text("Devices",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
            SizedBox(
              width: 200,
            ),
          ],
          //leading: IconButton(onPressed: () {  }, icon: Icon(Icons.menu),),
        ),



        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                // welcome home
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Home,",
                        style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                      ),
                      Text(
                        'Mitch Koko',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 40),
                      ),
                    ],
                  ),
                ),
      
                const SizedBox(height: 25),
      
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 204, 204, 204),
                  ),
                ),
      
                const SizedBox(height: 25),
      
                // smart devices grid
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: Text(
                    "Smart Devices",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
      
                // grid
                Expanded(
                  child: GridView.builder(
                    itemCount: mySmartDevices.length,
                    //physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        smartDeviceName: mySmartDevices[index][0],
                        iconPath: mySmartDevices[index][1],
                        powerOn: mySmartDevices[index][2],
                        onChanged: (value) => powerSwitchChanged(value, index),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
