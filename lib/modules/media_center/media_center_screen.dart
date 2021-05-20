import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/modules/media_center/bloc/cubit.dart';
import 'package:innosoft/modules/media_center/bloc/states.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/style/text_style.dart';
import 'package:innosoft/shared/components/components.dart';
class MediaCenterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).appDirection,
      child: BlocConsumer<MediaCenterCubit,MediaCenterStates>(
           listener: (context,state){},
           builder: (context,state){
             var cubit = MediaCenterCubit.get(context);
             return Column(
               children: [
                 Stack(
                   alignment: Alignment.center,
                   children: [
                     Image(image: AssetImage('assets/images/mediabar.png')),
                     Image(
                         height: 40,
                         width: 61,
                         image: AssetImage('assets/images/logo.png')),
                     Positioned(
                       bottom: 0,
                       child: Container(
                         height: 40,
                         child: Center(
                           child: ListView.builder(
                             shrinkWrap: true,
                             physics: NeverScrollableScrollPhysics(),
                             scrollDirection: Axis.horizontal,
                             itemBuilder: (context,index)=>mediaBarItems(
                                 text: cubit.tabs[index],
                                 indicatorColor: cubit.mediaIndex==index ? Colors.white: Colors.transparent,
                                 onTap: (){
                                   cubit.changeIndex(index);
                                 }
                             ),
                             itemCount: 3,
                           ),
                         ),
                       ),
                     ),

                   ],
                 ),
                 Expanded(
                   child: PageView.builder(
                       itemCount: cubit.tabs.length,
                       physics: NeverScrollableScrollPhysics(),
                       onPageChanged: (index){
                         cubit.changeIndex(index);
                       },
                       itemBuilder:(context,index)=>cubit.screens[cubit.mediaIndex], ),
                 ),


               ],
             );
           },

      ),
    );

  }



}
