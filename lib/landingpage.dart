import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qoruz/common.dart';

import 'home.dart';

// This is the 1st Screen
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(25, 50, 25, 30),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                      'Productive \nTask Manager',
                    style: TextStyle(
                      letterSpacing: 0.3,
                      fontFamily: 'Gilroy SemiBold',
                      fontWeight: FontWeight.bold,
                      fontSize: 30
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                      'Plan your daily work \nand convenient task manager for all.',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  SizedBox(height: 30),
                  Center(child: Image.asset(
                      ImagePaths.landingpage(),
                    height: MediaQuery.of(context).size.height*0.5,
                  )
                  ),

                ],
              ),
              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: (){
                    try{
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
                    }catch(e){
                      print('Exception is '+ e.toString());
                    }
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    elevation: 0,
                    color: ColorResources.primary(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: Center(
                        child: Text(
                              'Get Started',
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xffffffff),
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
