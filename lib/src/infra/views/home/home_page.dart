import 'package:app/src/utils/color/app_colors.dart';
import 'package:flutter/material.dart';

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {


    double screenHeight = MediaQuery.of(context).size.height;
    double screenWight = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primaryColorApp,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColorApp,
        elevation: 0.0,
        title: const Text('Cardápio', 
          style: TextStyle(
            color: AppColors.blackColorApp,
            fontWeight: FontWeight.normal,
            fontSize: 35,
            ),
          ),
        actions: [
           IconButton(onPressed: (){
           // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ProfileScreen()));
           
          },
          icon:  const Icon(Icons.person, color: Colors.black, size: 35,),
          ),
        ],
      ),
      extendBody: true,
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * .05, left: screenWight * .04, right: screenWight * .04),
        child: Stack(
          //alignment: Alignment.topLeft,
          children:[
            const Text("Escolha o recipiente", 
            style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 18
              ),
            ),
            PageView(
              children: [
                Container(color: Colors.amber,),
                Container(color: Colors.amber,),
            ],),
          ],
        ),
      ),
    );
  }
}