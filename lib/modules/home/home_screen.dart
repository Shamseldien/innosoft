import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/shared/bloc/app_states.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/components/components.dart';
import 'package:innosoft/shared/components/constant.dart';
import 'package:innosoft/shared/style/colors.dart';
import 'package:innosoft/shared/style/text_style.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).appDirection,
      child: BlocConsumer<AppCubit,AppStates>(
           listener: (context,state){},
           builder: (context,state){
             var cubit=AppCubit.get(context);
             return  Column(
               children: [
                 Image(
                   image: AssetImage('assets/images/appbar.png'),
                 ),
                 Expanded(
                   child: SingleChildScrollView(
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Padding(
                           padding: const EdgeInsets.all(15.0),
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.start,
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               Row(
                                 children: [
                                   Text('${appLang(context).latestNews}',style: black16(),),
                                   Spacer(),
                                   Text('${appLang(context).more}',style: black14().copyWith(color: Colors.blue),),
                                 ],
                               ),
                               SizedBox(height: 10,),
                               Stack(
                                 alignment: Alignment.bottomRight,
                                 children: [
                                   Container(
                                     clipBehavior: Clip.antiAlias,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(4.0)
                                     ),
                                     child: Image(
                                       image: AssetImage('assets/images/newspic.png'),
                                       fit: BoxFit.fill,
                                       height: 176,
                                       width: double.infinity,
                                     ),
                                   ),
                                   Image(
                                       height: 41.2 ,
                                       width: 56.42,
                                       image: AssetImage('assets/images/leaguelogo.png'))

                                 ],
                               ),
                               SizedBox(height: 10,),
                               Text('${appLang(context).leagueSport}',style: grey14(),),
                               Text('من الملاعب السعودية الى منصة التتويج بكأس العالم...',style: black16().copyWith(
                                   fontWeight: FontWeight.bold
                               ),),
                             ],
                           ),
                         ),
                         SizedBox(height: 10,),
                         Stack(
                           children: [
                             Padding(
                               padding: const EdgeInsets.symmetric(horizontal: 15),
                               child: Row(
                                 children: [
                                   Text('${appLang(context).nextMatches}',style: black16(),),
                                   Spacer(),
                                   Text('${appLang(context).more}',style: black14().copyWith(color: Colors.blue),),
                                 ],
                               ),
                             ),

                             Padding(
                               padding: const EdgeInsets.only(top: 10,),
                               child: ListView.separated(
                                 physics: NeverScrollableScrollPhysics(),
                                 shrinkWrap: true,
                                 itemCount: 3,
                                 itemBuilder: (context,index)=>nextMatchItems(),
                                 separatorBuilder: (context,index)=>Container(
                                   height: 1.0,
                                   color: Colors.grey[200],
                                   width: double.infinity,),
                               ),
                             ),

                           ],
                         ),
                         SizedBox(height: 20,),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 15),
                           child: Row(
                             children: [
                               Text('${appLang(context).latestTweet}',style: black16(),),
                               Spacer(),
                               Text('${appLang(context).more}',style: black14().copyWith(color: Colors.blue),),
                             ],
                           ),
                         ),
                         ListView.separated(
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             itemBuilder: (context,index)=>tweetItem(
                               context: context
                             ),
                             separatorBuilder: (context,index)=>Padding(
                               padding: const EdgeInsets.symmetric(horizontal:20 ),
                               child: Container(
                                 height: 1.0,
                                 width: double.infinity,
                                 color: Colors.grey[300],
                               ),
                             ),
                             itemCount: 2),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                           child: Text('${appLang(context).winner}',style: black16(),),
                         ),
                         Container(
                           height: 186,
                           color: Colors.white,
                           child: Center(
                             child: ListView.builder(
                               shrinkWrap: true,
                               physics: NeverScrollableScrollPhysics(),
                               scrollDirection: Axis.horizontal,
                               itemBuilder: (context,index)=>winTeam(
                                 percentage:int.parse(cubit.teamsPercentageList[index]),
                               team: cubit.teamsList[index]
                             ),
                               itemCount: cubit.teamsList.length,
                             ),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                           child: Text('${appLang(context).video}',style: black16(),),
                         ),
                         Container(
                           height: 255,
                           width: double.infinity,
                           color: Colors.white,
                           child: Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                             child: Image(
                                 height: 194.71,
                                 width: 343,
                                 image: AssetImage('assets/images/video.png')),
                           ),
                         ),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                           child: Text('${appLang(context).sponsors}',style: black16(),),
                         ),

                         Container(
                           height: 124,
                           width: double.infinity,
                           color: Colors.white,
                           child:Padding(
                             padding: const EdgeInsets.symmetric(
                               horizontal: 15,
                               vertical: 20
                             ),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Image(
                                     width: 160,
                                     height: 64,
                                     image: AssetImage('assets/images/sponsors.png')),
                                 Image(
                                     width: 160,
                                     height: 64,
                                     image: AssetImage('assets/images/sponsors.png'))
                               ],
                             ),
                           ) ,
                         ),

                         SizedBox(height: 35,),


                       ],
                     ),
                   ),
                 ),
               ],
             );
           },
      )
    );
  }
}
