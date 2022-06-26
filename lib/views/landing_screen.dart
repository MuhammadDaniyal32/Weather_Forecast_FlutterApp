import 'package:flutter/material.dart';
import 'package:weather_app/utility/app_colors.dart';
import 'package:weather_app/utility/spacing.dart';
import 'package:weather_app/utility/utils.dart';
import 'package:weather_app/views/city_selection_screen.dart';

class LandingScreen extends StatefulWidget {


  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbgColor,
      body: Column(
        children: [
          VerticalSpacing(UIExt(context).screenHeight()*0.038),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth()*0.050),
              Text("Hello,",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w600,color: AppColors.appsecondryColor))
            ],
          ),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth()*0.050),
              Text("let’s set you",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w600,color: AppColors.lightgreyColor))
            ],
          ),
          Row(
            children: [
              HorizontalSpacing(UIExt(context).screenWidth()*0.050),
              Text("weather",style: TextStyle(fontSize: 60,fontWeight: FontWeight.w600,color: AppColors.appprimaryColor))
            ],
          ),
          Image(image: AssetImage('assets/images/landing_img.png')),
          VerticalSpacing(UIExt(context).screenHeight()*0.020),
          GestureDetector(
            onTap: ()=>oncurrentloc_tap(context),
            child: Container(
              width: 300,
              height: 72,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(9)),
                color: Color(0xffE0E0E0)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalSpacing(UIExt(context).screenWidth()*0.050),
                  Text("Select Current Location",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(Icons.arrow_forward),
                  HorizontalSpacing(UIExt(context).screenWidth()*0.050),
                ],
              ),
            ),
          ),
          VerticalSpacing(UIExt(context).screenHeight()*0.020),
          GestureDetector(
            onTap: (){},
            child: Container(
              width: 300,
              height: 72,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(9)),
                color: AppColors.appprimaryColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HorizontalSpacing(UIExt(context).screenWidth()*0.050),
                  Text("Select Current Location",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                  Spacer(),
                  Icon(Icons.arrow_drop_down_outlined),
                  HorizontalSpacing(UIExt(context).screenWidth()*0.050),
                ],
              ),
            ),
          ),


        ]
      ),
    );
  }

  oncurrentloc_tap(BuildContext context) {
     Navigator.of(context).push(MaterialPageRoute(builder: (_) => CitySelectionScreen()));
  }
}
