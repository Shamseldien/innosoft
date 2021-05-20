import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/modules/home/home_screen.dart';
import 'package:innosoft/modules/league_table/league_table_screen.dart';
import 'package:innosoft/modules/media_center/media_center_screen.dart';
import 'package:innosoft/modules/side_menu/side_menu.dart';
import 'package:innosoft/shared/bloc/app_states.dart';
import 'package:innosoft/shared/components/components.dart';
import 'package:innosoft/shared/components/constant.dart';
import 'package:innosoft/shared/language_model/language_model.dart';
import 'package:innosoft/shared/network/repository.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitState());

  static AppCubit get(context)=>BlocProvider.of(context);

  LanguageModel appLanguageModel;

  TextDirection appDirection = TextDirection.ltr;

  Future<void> setAppLanguage({translationFile, code}) async {
    appLanguageModel =  LanguageModel.fromJson(jsonDecode(translationFile));
    appDirection = await code == 'ar' ? TextDirection.rtl : TextDirection.ltr;
    emit(AppSetLanguageState());
  }




  List titles =[];
  List teamsList  =[
    'النهضة',
    'الهلال',
    'الاتحاد',
  ];

  void titlesList(context){
    titles =[
      '${appLang(context).home}',
      '${appLang(context).league}',
      '${appLang(context).media}',
      '${appLang(context).states}',
      '${appLang(context).more}',
    ];

  }


  List iconsList =[
    'homeicon',
    'league',
    'media',
    'star',
    'more',
  ];



  List teamsPercentageList =[
    '20',
    '60',
    '30',
  ];

  List screens = [
    HomeScreen(),
    LeagueTableScreen(),
    MediaCenterScreen(),
    Center(child: Text('ful state'),),
    SideMenuScreen(),
  ];


  int currentIndex =0;
  void changeIndex(index){
    currentIndex = index;
    emit(AppChangeIndexState());
  }

  List<bool> selectedLanguage = [
    false,
    false,
  ];


  int selectedLanguageIndex;

  void changeSelectedLanguage(int index) {
    selectedLanguageIndex = index;

    for (int i = 0; i < selectedLanguage.length; i++) {
      if (i == index) {
        selectedLanguage[i] = true;
      } else {
        selectedLanguage[i] = false;
      }
    }

    emit(AppStateSelectLang());
  }


  List tabs =[];


  void tabsTitle(context){
    tabs =[
      '${appLang(context).clubGuide}',
      '${appLang(context).stadiumGuide}',
      '${appLang(context).aboutUs}',
      '${appLang(context).laws}',
      '${appLang(context).committees}',
      '${appLang(context).contactUs}',
      '${appLang(context).share}',
      '${appLang(context).subscribe}',

    ];

  }

  List socialIcon =[
    'facebook',
    'twitter',
    'insta',
    'linked',
    'youtube',


  ];


  List sideColors =[
    Colors.pink,
    Colors.grey,
    Colors.white,
    Colors.greenAccent,
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.deepPurpleAccent,
  ];

  Future changeLanguage({context}){
    return  showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context)=>Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: appDirection,
            child: Container(
              width: 250,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              languageItem(
                                  context: context,
                                  index: index,
                                  model: languageList[index]
                              ),
                          separatorBuilder: (context, index) =>
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0),
                                child: Container(
                                  height: 1,
                                  width: double.infinity,
                                  color: Colors.grey[300],
                                ),
                              ),
                          itemCount:languageList.length),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: TextButton(
                            onPressed: (){
                              int selectedIndex = selectedLanguageIndex;
                              var model = languageList;
                              saveLanguageCode(model[selectedIndex].code).then((value){
                                getTranslationFile(model[selectedIndex].code).then((value){
                                  setAppLanguage(
                                      translationFile:value,
                                      code: model[selectedIndex].code
                                  ).then((value){
                                    Navigator.pop(context);
                                  }).catchError((error){
                                    print('error1====>$error');
                                  });
                                }).catchError((error){
                                  print('error2====>$error');
                                });
                              }).catchError((error){
                                print('error3====>$error');
                              });
                            }
                            ,child: Text('${appLang(context).save}')),
                      )

                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
