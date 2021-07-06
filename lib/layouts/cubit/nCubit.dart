

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/cubit/nState.dart';
import 'package:newsapp/networks/shared_prefer.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isdark = false ;

  void changemood({bool isdrk}){

    if(isdrk != null){
      isdark = isdrk;
      emit(ChangeMode());
    }else{
      isdark = !isdark;
      SharedPref.setbool(key: 'isDark', val: isdark).then((value){
        emit(ChangeMode());
      });
    }
  }

}