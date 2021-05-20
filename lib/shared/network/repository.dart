import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:innosoft/shared/network/end_points.dart';
import 'package:innosoft/shared/network/local/cash_helper.dart';
import 'package:innosoft/shared/network/remote/dio_helper.dart';


abstract class Repository {
Future<Response>getLeagueTable({query});

}

class RepositoryImplementation extends Repository {
  DioHelper dioHelper;
  CashHelper cashHelper;
  RepositoryImplementation({@required this.cashHelper,@required this.dioHelper});

  @override
  Future<Response> getLeagueTable({query})async {
    return await dioHelper.getData(url: END_POINT,query: query);
  }
  
  
}
