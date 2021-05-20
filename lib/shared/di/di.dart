import 'package:get_it/get_it.dart';
import 'package:innosoft/modules/league_table/bloc/cubit.dart';
import 'package:innosoft/modules/media_center/bloc/cubit.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/network/local/cash_helper.dart';
import 'package:innosoft/shared/network/remote/dio_helper.dart';
import 'package:innosoft/shared/network/repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt di = GetIt.I..allowReassignment = true;

Future initApp() async {
  final preferences = await SharedPreferences.getInstance();

  di.registerLazySingleton<SharedPreferences>(() => preferences);

  di.registerLazySingleton<CashHelper>(
      () => CashImplementation(di<SharedPreferences>()));
  di.registerLazySingleton<DioHelper>(() => DioImplementation());
  di.registerLazySingleton<Repository>(() => RepositoryImplementation(
      cashHelper: di<CashHelper>(), dioHelper: di<DioHelper>()));


  di.registerFactory<AppCubit>(() => AppCubit());
  di.registerLazySingleton<LeagueTaleCubit>(() => LeagueTaleCubit(di<Repository>()));
  di.registerLazySingleton<MediaCenterCubit>(() => MediaCenterCubit());


}
