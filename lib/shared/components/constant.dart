
import 'package:flutter/services.dart';
import 'package:innosoft/shared/bloc/cubit.dart';
import 'package:innosoft/shared/di/di.dart';
import 'package:innosoft/shared/language_model/language_model.dart';
import 'package:innosoft/shared/network/local/cash_helper.dart';

String appLanguage ='';
const String APP_LANG_KEY='appLang';



Future<bool> saveLanguageCode(code)async{
  appLanguage = code;
  return await di<CashHelper>().put(key: APP_LANG_KEY, value: code);
}


Future<String> getLangCode()async{
  return await di<CashHelper>().get(key: APP_LANG_KEY);
}


Future<String>getTranslationFile(appLang)async{
  return await rootBundle.loadString('assets/translation/${appLang ?? 'en'}.json');
}



LanguageModel appLang(context) => AppCubit.get(context).appLanguageModel;