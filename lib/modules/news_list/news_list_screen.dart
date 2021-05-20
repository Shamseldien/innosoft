import 'package:flutter/material.dart';
import 'package:innosoft/modules/news_screen/news_screen.dart';
import 'package:innosoft/shared/components/components.dart';
import 'package:innosoft/shared/style/text_style.dart';

class NewsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
        itemCount: 10,
          itemBuilder:(context,index)=> mediaListItems(
            context: context,
            onTap: (){
              navigateTo(
                context: context,
                widget: NewsScreen()
              );
            }
          )),
    );
  }
}
