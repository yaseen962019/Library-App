import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:library_app_final_project/CORE/View/Home_Screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF202323),

        body: Column(
              children:[
                Container(
                  
            
                child:Image.asset('assets/images/back-0١.png'),
              ),
                SizedBox(
                  height: 60,
                  width: 390,
                  child: ElevatedButton(
                    onPressed:(){
                      Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF202323),
                      padding: const EdgeInsets.all(12),

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      side: BorderSide(
                        color: Colors.white,
                        width: 3,
                      )
                    ),
                    child: const Text('Start', style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ),
              ]
          ),
      ),
    );

  }
}







