import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_app/core/widgets/app_background.dart';
import 'package:weather_clean_app/core/widgets/botton_nav.dart';
import 'package:weather_clean_app/features/feature_bookmark/presentation/screens/bookmark_screen.dart';
import 'package:weather_clean_app/features/feature_weather/domain/entities/current_city_entity.dart';
import 'package:weather_clean_app/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:weather_clean_app/features/feature_weather/presentation/bloc/home_bloc.dart';

import '../../features/feature_weather/presentation/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  MainWrapper({Key? key}) : super(key: key);
  final PageController pageController=PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    List<Widget> pageViewWidget =[
      const HomeScreen(),
      const BookMarkScreen(),
    ];
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNav(Controller: pageController,),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AppBackground.getBackGroundImage(),
            fit: BoxFit.cover
          )
        ),

        height: height,
        child: PageView(
          controller: pageController,
          children: pageViewWidget,
        ),
      ),
    );
  }
}





// class MainWrapper extends StatefulWidget {
//   const MainWrapper({Key? key}) : super(key: key);
//
//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }
//
// class _MainWrapperState extends State<MainWrapper> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCwEvent("Tehran"));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(),
//         body:
//   }
// }
