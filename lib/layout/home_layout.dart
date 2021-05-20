import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/shared/bloc/app_states.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/components/components.dart';
import 'package:innosoft/shared/style/colors.dart';
import 'package:innosoft/shared/style/text_style.dart';


enum BottomIcons { Home, Favorite, Search, Account }

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<AppCubit,AppStates>(
       listener: (context,state){},
       builder: (context,state){
         var cubit = AppCubit.get(context);
         return Scaffold(
           body: Column(
             children: [
               Expanded(
                 child: PageView.builder(
                     itemCount: cubit.screens.length,
                     physics: NeverScrollableScrollPhysics(),
                     onPageChanged: (index){
                       cubit.changeIndex(index);
                     },
                     itemBuilder:(context,index)=>cubit.screens[cubit.currentIndex] ),
               ),
               Align(
                 alignment: Alignment.bottomCenter,
                 child: Container(
                   height: 89,
                   color: mainColor,
                   child: Column(
                     children: [
                       Container(
                         height:62 ,
                         width: double.infinity,
                         child: Center(
                           child: ListView.builder(
                               itemCount: cubit.titles.length,
                               scrollDirection: Axis.horizontal,
                               shrinkWrap: true,
                               itemBuilder:(context,index){
                                 return Center(
                                   child: Padding(
                                     padding: EdgeInsets.only(
                                       top: 8,
                                       left: 12,
                                       right: 12
                                     ),
                                     child: navBarItem(
                                         iconColor: cubit.currentIndex==index
                                             ? Colors.white : Colors.grey,
                                         textStyle: cubit.currentIndex==index
                                             ? white10() : grey10(),
                                         text: cubit.titles[index],
                                         icon: cubit.iconsList[index],
                                         onPressed: (){
                                           cubit.changeIndex(index);
                                         }
                                     ),
                                   ),
                                 );
                               }),
                         ),
                       ),
                       Spacer(),
                       Padding(
                         padding: const EdgeInsets.only(bottom:10 ),
                         child: Container(
                           height: 5,
                           width: 134,
                           decoration: BoxDecoration(
                               color: Colors.white,
                               borderRadius: BorderRadius.circular(34)
                           ),
                         ),
                       )
                     ],
                   ),
                 ),
               )
             ],
           ),


         );
       },
   );
  }


}
