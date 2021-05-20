import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:innosoft/models/league/league_model.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/components/constant.dart';
import 'package:innosoft/shared/language_model/language_model.dart';
import 'package:innosoft/shared/style/text_style.dart';

Widget navBarItem({icon,iconColor = Colors.grey,text,textStyle,onPressed})=> GestureDetector(
  onTap: onPressed,
  child:   Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image(image: AssetImage('assets/images/$icon.png'),height: 33,width: 34,color: iconColor,),
      SizedBox(height: 2,),
      Text('$text',style: textStyle,),
    ],
  ),
);


Widget nextMatchItems()=>  Container(
  height: 45,
  color: Colors.white,
  child:   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image(
                width:28.77,
                height: 34,
                image: AssetImage('assets/images/logoclub.png')),
            SizedBox(width: 20,),
            Text('الاهلى',style: black14().copyWith(
                fontWeight: FontWeight.bold
            ),),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('22:00',style: black12(),),
            Text('الخميس 15 يوليو',style: grey11(),),
          ],
        ),
        Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('الاهلى',style: black14().copyWith(
                fontWeight: FontWeight.bold
            ),),
            SizedBox(width: 20,),
            Image(
                width:28.77,
                height: 34,
                image: AssetImage('assets/images/logoclub.png')),

          ],
        ),


      ],
    ),
  ),
);



Widget tweetItem({context})=>Container(
  width: double.infinity,
  color: Colors.white,
  child: Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
    child: Column(
      children: [
        Row(
          children: [
            Image(
                height: 34,
                width: 53,
                image:AssetImage('assets/images/leading.png') ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${appLang(context).leagueSport}',style: black16().copyWith(
                    fontWeight: FontWeight.bold
                ),),
                Text('@account',style: grey14(),)
              ],
            )
          ],
        ),
        Text('عندما يريد العالم ان يتكلم , فهو يتحدث بلغة يونيكود . تسجل الان لحضور المؤتمر الدولى العاشر ليونيكود (Unicode conference)٫ الذى سيعقد فى 10-12 اذار 1997 بمدينة مايتس المانيا.',)
      ],
    ),
  ),
);


Widget winTeam({String team,int percentage})=>Padding(
  padding: const EdgeInsets.all(15),
  child:   Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 103.5,
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
                color: Colors.grey[400],
                width: 1
            )
        ),
        child: Center(
          child: Image(
            width: 37.93,
            height: 45,
            image: AssetImage('assets/images/logoclub.png'),),

        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text('$team',style: black16().copyWith(
          fontWeight: FontWeight.bold
      ),),
      Text('$percentage%')
    ],
  ),
);



Widget mediaBarItems({onTap,text,indicatorColor})=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      GestureDetector(
        onTap:onTap,
        child: Text('$text',style: white14().copyWith(
            fontWeight: FontWeight.bold
        ),),
      ),
      Container(
        color: indicatorColor,
        width: 95,
        height: 3,
      ),
    ],
  ),
);

Widget mediaListItems({onTap,context})=>InkWell(
  onTap: onTap,
  child:   Padding(
    padding: const EdgeInsets.only(
      left: 15,
      right: 15,
      bottom: 10
    ),
    child:   Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 100,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/newspic.png'),
                  )
              ),
            ),
            Image(
                height: 25.7,
                width: 34.33,
                image: AssetImage('assets/images/leaguelogo.png'))
          ],
        ),
        SizedBox(width: 10,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${appLang(context).leagueSport}',style: grey14(),),
              Text('من الملاعب السعودية إلى منصة التتويج بكأس العالم..',style: black14().copyWith(
                  fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 5,),
              Text('12 يوليو 2018',style: grey11(),),
            ],
          ),
        )
      ],
    ),
  ),
);

Widget sideMenuItems({text,color})=> Padding(
  padding: const EdgeInsets.symmetric(vertical: 5),
  child:   Row(
    children: [
      Container(
        width: 1,
        height:35 ,
        color: color,
      ),
      SizedBox(width: 25,),
      Text('$text',style: white20(),),
    ],
  ),
);

Future navigateTo({context,widget})=>Navigator.push(
    context, MaterialPageRoute(builder: (context)=>widget));


Widget leagueItems({Data data})=> Padding(
  padding: const EdgeInsets.all(15.0),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 120,
        width: 130,
        decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${data.avatar}')
            ),
            borderRadius: BorderRadius.circular(10.0)
        ),
      ),
      SizedBox(width: 20,),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${data.firstName} ${data.lastName}',style: black18().copyWith(
              fontWeight: FontWeight.bold
          ),),
          SizedBox(
            height: 10,
          ),
          Text('${data.email}'),
        ],
      )
    ],
  ),
);


Widget languageItem({LanguageModelList model, index, context}) => InkWell(
  onTap: () {
    AppCubit.get(context).changeSelectedLanguage(index);
  },
  borderRadius: BorderRadius.circular(20.0),
  splashColor: Colors.green,
  child: Container(
    height: 50,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Text(model.language),
          Spacer(),
          if (AppCubit.get(context).selectedLanguage[index])
            Icon(Icons.language),
        ],
      ),
    ),
  ),
);

class LanguageModelList {
  final String language;
  final String code;

  LanguageModelList({
    this.language,
    this.code,
  });
}

List<LanguageModelList> languageList = [
  LanguageModelList(code: 'ar', language: 'العربيه'),
  LanguageModelList(code: 'en', language: 'English'),
];


