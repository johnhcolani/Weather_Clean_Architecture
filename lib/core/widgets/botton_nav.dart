
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatelessWidget {
  PageController Controller;
   BottomNav({Key? key , required this.Controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var primaryColor =Theme.of(context).primaryColorDark;
    TextTheme textTheme =Theme.of(context).textTheme;

    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 5,
      color: Colors.green.withOpacity(0.2),
      child: SizedBox(
        height: 63,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(

                onPressed: (){
                  Controller.animateToPage(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                },
                icon: const Icon(Icons.home,size: 32,),color: Colors.white,),
            const SizedBox(),
            IconButton(onPressed: (){
              Controller.animateToPage(1, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
            }, icon: const Icon(Icons.bookmark,size: 32),color: Colors.white,),

          ],
        ),
      ),
    );
  }
}
