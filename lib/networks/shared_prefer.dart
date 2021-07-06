

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {

  static SharedPreferences shardpref;


  static init() async{
     shardpref = await SharedPreferences.getInstance();
  }

  static Future<bool> setbool({@required String key , @required bool val}) async{
    return await shardpref.setBool(key, val);
  }

  static bool getbool(key){
    return shardpref.getBool(key);
  }
}