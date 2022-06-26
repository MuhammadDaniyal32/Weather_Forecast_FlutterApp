import 'package:flutter/material.dart';
import 'package:weather_app/utility/app_colors.dart';
import 'package:weather_app/utility/utils.dart';
import 'package:weather_app/widgets/List_Tile.dart';
import '../utility/spacing.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appbgColor,
      body: Stack(
        children: [
        Container(
          height: UIExt(context).screenHeight()*0.597,
          child: SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset('assets/images/home_bg.png'),
              )),
        ),
          Positioned(
              child: Column(
                children: [
                  VerticalSpacing(UIExt(context).screenHeight()*0.055),
                  Row(
                    children: [
                      HorizontalSpacing(UIExt(context).screenWidth()*0.035),
                      GestureDetector(onTap: ()=>onrefresh_pressed(context),child: Icon(Icons.refresh,color: AppColors.whiteColor)),
                      HorizontalSpacing(UIExt(context).screenWidth()*0.25),
                      Text("Australia",style:TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: AppColors.whiteColor)),
                      HorizontalSpacing(UIExt(context).screenWidth()*0.01),
                      Image(image: AssetImage('assets/images/arrow_down.png'),height: 10,width: 18)
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.050),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("12°",style:TextStyle(fontSize: 100,fontWeight: FontWeight.w700,color: AppColors.whiteColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Night, Clear Sky",style:TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: AppColors.whiteColor)),
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.35),
                  Row(
                    children: [
                      HorizontalSpacing(UIExt(context).screenWidth()*0.025),
                      Text("Today",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.blackColor)),
                      Spacer(),
                      Text("Sydney, Australia",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColors.darkgreyColor)),
                      HorizontalSpacing(UIExt(context).screenWidth()*0.025),
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.036),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Now",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("9PM",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("10PM",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("11PM",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("12PM",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.030),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(image: AssetImage('assets/images/cloud_img.png')),
                      Image(image: AssetImage('assets/images/cloud_img.png')),
                      Image(image: AssetImage('assets/images/cloud_img.png')),
                      Image(image: AssetImage('assets/images/cloud_img.png')),
                      Image(image: AssetImage('assets/images/cloud_img.png')),
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.020),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("22°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("20°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("18°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("22°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("16°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),

                    ],
                  )
              ],)
          )
        ])
    );
  }

  onrefresh_pressed(BuildContext context) {}
}
