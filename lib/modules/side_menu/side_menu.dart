import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/shared/bloc/app_states.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/components/components.dart';
import 'package:innosoft/shared/components/constant.dart';
import 'package:innosoft/shared/style/colors.dart';
import 'package:innosoft/shared/style/text_style.dart';
class SideMenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              brightness: Brightness.dark,
              backgroundColor:mainColor,
              toolbarHeight: 20.0,
            ),
            body: Container(
              color: mainColor,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Image(
                            width: 70,
                            height: 45,
                            image: AssetImage('assets/images/logo.png')),
                        Spacer(),
                      BlocConsumer<AppCubit,AppStates>(
                          listener: (context,state){},
                          builder: (context,state){
                           return TextButton(onPressed: (){
                             AppCubit.get(context).changeLanguage(context: context);
                            }, child:Text('${appLang(context).changeLang}',style: white18().copyWith(
                                color: Colors.lightBlueAccent
                            ),));
                          },
                      )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                 Expanded(child: SingleChildScrollView(
                   child: Column(
                     children: [
                       ListView.builder(
                         shrinkWrap: true,
                         itemCount: cubit.tabs.length,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context,index)=>sideMenuItems(
                             text: cubit.tabs[index],
                             color: cubit.sideColors[index]
                         ),),

                       ListView.builder(
                         shrinkWrap: true,
                         itemCount:cubit.socialIcon.length,
                         physics: NeverScrollableScrollPhysics(),
                         itemBuilder: (context,index)=>Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                           child: Align(
                             alignment: AlignmentDirectional.topEnd,
                             child: Image(
                               height: 17,
                               width: 17,
                               image: AssetImage('assets/images/${cubit.socialIcon[index]}.png'),),
                           ),
                         ),),
                     ],
                   ),
                 ))


                ],
              ),
            ),
          );
        },
    );
  }
}
