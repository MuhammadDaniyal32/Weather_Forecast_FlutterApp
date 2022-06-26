import 'package:flutter/material.dart';
import 'package:weather_app/model/forecastmodel.dart';
import 'package:weather_app/utility/app_colors.dart';
import 'package:weather_app/utility/utils.dart';
import 'package:weather_app/widgets/List_Tile.dart';
import '../services/remoteservices/weather_forcast_service.dart';
import '../utility/spacing.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  Position? position;
  String? city;

  HomeScreen({this.position, this.city});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
String? country,conditiontxt,city;
double? tempC;
Hour? hour1,hour2,hour3,hour4,hour5;
final dateFormat = DateFormat('h:mm a');

  @override
  void initState() {
    if (widget.position != null) {
      WeatherForcastService().getForecast(position: widget.position).then((value) {
        if(value!= null)
          {
            setState(() {
              hour1 = value['1'] as Hour;
              hour2 = value['2'] as Hour;
              hour3 = value['3'] as Hour;
              hour4 = value['4'] as Hour;
              hour5 = value['5'] as Hour;
            });
          }
      });
        WeatherForcastService().getCurrentTemp(position: widget.position).then((value){
        if(value != null)
          {
            setState(() {
              country = value['country'];
              conditiontxt = value['conditionText'];
              city = value['city'];
              tempC = value['tempC'];
              country = value['country'];
            });
          }
      });
    }
    else if (widget.city != null) {
        WeatherForcastService().getCurrentTemp(City: widget.city).then((value){
        if(value != null)
          {
            setState(() {
              country = value['country'];
              conditiontxt = value['conditionText'];
              city = value['city'];
              tempC = value['tempC'];
              country = value['country'];
            });
          }
      });
    }
  }

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      HorizontalSpacing(UIExt(context).screenWidth()*0.035),
                      GestureDetector(onTap: ()=>onrefresh_pressed(context),child: Icon(Icons.refresh,color: AppColors.whiteColor)),
                      HorizontalSpacing(UIExt(context).screenWidth()*0.25),
                      Text(country.toString(),style:TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: AppColors.whiteColor)),
                      HorizontalSpacing(UIExt(context).screenWidth()*0.01),
                      Image(image: AssetImage('assets/images/arrow_down.png'),height: 10,width: 18)
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.050),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("$tempC°",style:TextStyle(fontSize: 100,fontWeight: FontWeight.w700,color: AppColors.whiteColor)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Night, $conditiontxt",style:TextStyle(fontSize: 22,fontWeight: FontWeight.w400,color: AppColors.whiteColor)),
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.35),
                  Row(
                    children: [
                      HorizontalSpacing(UIExt(context).screenWidth()*0.025),
                      Text("Today",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.blackColor)),
                      Spacer(),
                      Text("$city,$country",style:TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: AppColors.darkgreyColor)),
                      HorizontalSpacing(UIExt(context).screenWidth()*0.025),
                    ],
                  ),
                  VerticalSpacing(UIExt(context).screenHeight()*0.036),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Now",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text(dateFormat.format(DateTime.parse(hour2?.time??"")),style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text(dateFormat.format(DateTime.parse(hour3?.time??"")),style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text(dateFormat.format(DateTime.parse(hour4?.time??"")),style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text(dateFormat.format(DateTime.parse(hour5?.time??"")),style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
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
                      Text("${hour1?.tempC}°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("${hour2?.tempC}°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("${hour3?.tempC}°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("${hour4?.tempC}°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),
                      Text("${hour5?.tempC}°",style:TextStyle(fontSize: 15,fontWeight: FontWeight.w400,)),

                    ],
                  )
              ],)
          )
        ])
    );
  }

  onrefresh_pressed(BuildContext context) {}


}
