import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/models/league/league_model.dart';
import 'package:innosoft/modules/league_table/bloc/states.dart';
import 'package:innosoft/modules/media_center/bloc/states.dart';
import 'package:innosoft/modules/news_list/news_list_screen.dart';
import 'package:innosoft/shared/network/repository.dart';

class LeagueTaleCubit extends Cubit<LeagueTableStates> {
  Repository repository;

  LeagueTaleCubit(this.repository) : super(LeagueTableInitState());

  static LeagueTaleCubit get(context) => BlocProvider.of(context);


 int currentPage =1;
 int totalPages =0;
 LeagueModel leagueModel;

  List<Data> listModel=[];



  Future getLeagueTable() async {
    emit(LeagueTableLoadingState());
    return await repository
        .getLeagueTable(
     query: {
       'page': currentPage,
     }
    ).then((value) {
     leagueModel = LeagueModel.fromJson(value.data);
     leagueModel.data.forEach((element) {
       listModel.add(element);
     });
     totalPages = value.data['total_pages'];
     currentPage++;
     emit(LeagueTableSuccessState());
    }).catchError((error) {
      currentPage--;
      print(error.toString());
      emit(LeagueTableErrorState(error));
    });
  }


  Future getMoreLeagueTable() async {
    emit(LeagueTableLoadingMoreState());
    return await repository
        .getLeagueTable(
        query: {
          'page':currentPage,
        }
    ).then((value) {
      currentPage++;
      leagueModel = LeagueModel.fromJson(value.data);
      leagueModel.data.forEach((element) {
        listModel.add(element);
      });
      emit(LeagueTableMorePostsState());
    }).catchError((error) {
      currentPage--;
      print(error.toString());
      emit(LeagueTableErrorState(error));
    });
  }
}
