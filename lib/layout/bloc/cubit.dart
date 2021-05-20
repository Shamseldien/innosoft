import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/layout/bloc/states.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates>{
  HomeLayoutCubit() : super(HomeLayoutInitState());

  static HomeLayoutCubit get(context)=>BlocProvider.of(context);


  int currentIndex =0;
  void changeIndex(index){
    currentIndex = index;
    emit(HomeLayoutChangeIndexState());
  }

}