import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qoruz/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
        child: Card(
          elevation: 5,
          shadowColor:  ColorResources.primary(),
          color:  ColorResources.primary(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(17)
          ),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Icon(
              CupertinoIcons.add,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'May 5, 2020',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Gilroy Bold',
                              color: Colors.grey.shade600
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Today',
                            style: TextStyle(
                                fontFamily: 'Gilroy SemiBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _dayFormat('Mon', '4',false),
                                _dayFormat('Tue', '5',false),
                                _dayFormat('Wed', '6',false),
                                _dayFormat('Thu', '7',false),
                                _dayFormat('Fri', '8',false),
                                _dayFormat('Sat', '9',true),
                                _dayFormat('Sat', '10',false),
                              ],
                            ),
                          ),
                          const SizedBox(height: 30),
                          _task('Wakeup', '7:00 AM', 'Early wake up from bed and fresh',true),
                          _task('Morning Exercise', '8:00 AM', '4 types of exercise',true),
                          _highlightedTask('Meeting', '9:00 AM', 'Zoom call, Discuss team task \nfor the day'),
                          _task('Breakfast', '10:00 AM', 'Morning Breakfast with bread, banana egg bowel and tea.',false),
                        ],
                      ),
              ),
              Positioned(
                bottom: 0,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 3,
                              blurRadius: 100,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ]
                        ),
                          child: Image.asset(
                              ImagePaths.bottomNavigation(),
                            height: 70,
                            fit: BoxFit.fitHeight,
                          )
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                                ImagePaths.clock(),
                              height: 35,
                            ),
                            Image.asset(
                              ImagePaths.profile(),
                              height: 35,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _dayFormat(String day,String date,bool highlighted){
    return Column(
      children: [
        Text(
            day,
          style: TextStyle(
            color: highlighted ? ColorResources.primary() : Colors.grey.shade700,
              fontFamily: highlighted ? 'Gilroy SemiBold' : 'Gilroy Regular'
          ),
        ),
        SizedBox(height: 5),
        Text(
            date,
          style: TextStyle(
            fontSize: 18,
            color: highlighted ? ColorResources.primary() : Colors.black,
            fontFamily: 'Gilroy SemiBold'
          ),
        ),
        highlighted ? Container(
          height: 4,
          width: 4,
          decoration: BoxDecoration(
            color: ColorResources.primary(),
            borderRadius: BorderRadius.circular(100)
          ),
        ) : Container()
      ],
    );
  }

  Widget _task(String title,String time,String description,bool _isLine){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(3, 0, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _circularRing(),
              SizedBox(height: 5),
              _verticalLine(2,_isLine ? 55 : 0)
            ],
          ),
        ),
        SizedBox(width: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xfff4f4fd),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 12, 25, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              title,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontFamily: 'Gilroy Bold',
                            ),
                          ),
                          Text(
                            time,
                            style: TextStyle(
                              color: Color(0xff9d9fa0),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                          description,
                        style: TextStyle(
                          color: Color(0xff9d9fa0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ),
        ),
      ],
    );
  }
  Widget _highlightedTask(String title,String time,String description){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _highlightedRing(),
            SizedBox(height: 5),
            _verticalLine(2,120)
          ],
        ),
        SizedBox(width: 15),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorResources.primary(),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 16,
                            fontFamily: 'Gilroy Bold',
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: Color(0xffffffff),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height:10),
                    Text(
                      description,
                      style: TextStyle(
                        color: Color(0xffffffff),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(ImagePaths.profilestack(),height: 30,),
                          Container(
                            decoration: BoxDecoration(
                              color:const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: Image.asset(ImagePaths.loading(),height: 25),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  Widget _circularRing(){
    return Container(
      height: 11,
      width: 11,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(width: 2,color: ColorResources.primary())
      ),
    );
  }
  Widget _highlightedRing(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2,color: ColorResources.primary())
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 11,
          width: 11,
          decoration: BoxDecoration(
            color: ColorResources.primary(),
              borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }
  Widget _verticalLine(double width,double height){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: ColorResources.primary()
      ),
    );
  }


}
