import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:innosoft/modules/league_table/bloc/cubit.dart';
import 'package:innosoft/modules/league_table/bloc/states.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/components/components.dart';
import 'package:innosoft/shared/components/constant.dart';
import 'package:innosoft/shared/style/colors.dart';
import 'package:innosoft/shared/style/text_style.dart';
import 'package:loading_indicator/loading_indicator.dart';
class LeagueTableScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: AppCubit.get(context).appDirection,
      child: BlocConsumer<LeagueTaleCubit,LeagueTableStates>(
          listener: (context,state){},
          builder: (context,state){
            var cubit = LeagueTaleCubit.get(context);
            var model = LeagueTaleCubit.get(context).listModel;
           return Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Image(
                 image: AssetImage('assets/images/appbar.png'),),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Container(
                   width:double.infinity,
                   child: Text('${appLang(context).league}',style: black18().copyWith(
                       fontWeight: FontWeight.bold
                   ),),
                 ),
               ),
               Expanded(
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     ConditionalBuilder(
                         condition: state is! LeagueTableLoadingState,
                         builder: (context)=>Expanded(
                           child: SingleChildScrollView(
                             child: Column(
                               children: [
                                 ListView.separated(
                                     shrinkWrap: true,
                                     physics: NeverScrollableScrollPhysics(),
                                     itemBuilder: (context,index)=>leagueItems(
                                         data: model[index]
                                     ),
                                     separatorBuilder: (context,index)=>Container(
                                       height: 1.0,
                                       width: double.infinity,
                                       color: Colors.grey[300],
                                     ),
                                     itemCount: model.length),
                                 if(cubit.totalPages>=cubit.currentPage)
                                 InkWell(
                                     onTap: (){
                                       cubit.getMoreLeagueTable();
                                     },
                                     child: Padding(
                                       padding: const EdgeInsets.all(10.0),
                                       child: state is LeagueTableLoadingMoreState
                                       ? Center(child: Container(
                                           height: 30,
                                           width: 50,
                                           child: LoadingIndicator(indicatorType: Indicator.ballPulse,
                                             color: mainColor,)))
                                           : Text('${appLang(context).more}',style: black18(),),
                                     )),
                               ],
                             ),
                           ),
                         ),
                       fallback: (context)=>Center(child: CircularProgressIndicator()),
                     )


                   ],
                 ),
               ),
             ],
           );
          },
      )
    );
  }
}
