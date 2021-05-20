import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/layout/bloc/cubit.dart';
import 'package:innosoft/layout/home_layout.dart';
import 'package:innosoft/modules/league_table/bloc/cubit.dart';
import 'package:innosoft/modules/media_center/bloc/cubit.dart';

import 'package:innosoft/shared/bloc/app_states.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/components/constant.dart';
import 'package:innosoft/shared/di/di.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();

  appLanguage = await getLangCode();
  String translationFile = await  getTranslationFile(appLanguage);


  runApp(MyApp(
    transFile: translationFile,
    code: appLanguage,
  ));
}

class MyApp extends StatelessWidget {
  final String transFile;
  final String code;
  MyApp({@required this.transFile,this.code,});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>di<AppCubit>()..setAppLanguage(
          translationFile: transFile,
          code: code
        )),
        BlocProvider(create: (context)=>di<MediaCenterCubit>()),
        BlocProvider(create: (context)=>di<LeagueTaleCubit>()..getLeagueTable()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
          listener: (context,state){},
          builder: (context,state){
            return Builder(
              builder: (BuildContext context) {
                AppCubit.get(context)..titlesList(context)..tabsTitle(context);
                MediaCenterCubit.get(context)..mediaTabs(context);
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(fontFamily: 'jannat'),
                  home: Directionality(
                      textDirection: AppCubit.get(context).appDirection,
                      child: HomeLayout()),
                );
              },

            );
          },
      ),
    );
  }
}


