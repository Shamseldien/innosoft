import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/modules/media_center/bloc/states.dart';
import 'package:innosoft/modules/news_list/news_list_screen.dart';
import 'package:innosoft/shared/components/constant.dart';

class MediaCenterCubit extends Cubit<MediaCenterStates>{
  MediaCenterCubit() : super(MediaCenterInitState());

  static MediaCenterCubit get(context)=>BlocProvider.of(context);


  int mediaIndex =0;
  void changeIndex(index){
    mediaIndex = index;
    emit(MediaCenterChangeIndexState());
  }


  List screens =[
    NewsListScreen(),
    Center(child: Text('الصور')),
    Center(child: Text('الفديوهات')),

  ];



  List tabs =[];

  void mediaTabs(context){
    tabs =[
      '${appLang(context).news}',
      '${appLang(context).pics}',
      '${appLang(context).video}',



    ];
  }
}