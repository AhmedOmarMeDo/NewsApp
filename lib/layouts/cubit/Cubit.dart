import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/cubit/States.dart';
import 'package:newsapp/modules/Buisness/Buisness.dart';
import 'package:newsapp/modules/Sience/Sience.dart';
import 'package:newsapp/modules/Sports/Sports.dart';
import 'package:newsapp/modules/settings/settings.dart';
import 'package:newsapp/networks/dio.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());

  //we create this object to access to the class info with class name

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> navBarIt = [
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Sience',
    ),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Buisness',
    ),

  ];

  List<Widget> screens = [
    Sience(),
    Sports(),
    Buisness(),
  ];

  void changestate(index) {
    currentIndex = index;

    if(index == 0)
      SienceData();
    if(index == 1)
      SportsData();
    if(index == 2)
      BuisnessData();

    emit(ChangeState());
  }

  var dataNumber;

  List<dynamic> Buisnesslist = [];
  List<dynamic> Sportslist = [];
  List<dynamic> Siencelist = [];
  List<dynamic> SearchList = [];

  void BuisnessData() {
    emit(BuisnesProgressIndicator());

    DoiHelper.getdata(
        url: 'v2/top-headlines',
        query: {
      'country': 'us',
      'category': 'Business',
      'apiKey': '3f730f6753974215b6b771cdb6c5b8cc',
    }).then((value) {
      Buisnesslist = value.data['articles'];

      emit(BuisnessSuccess());
    }).catchError((e) {
      emit(BuisnessFail());
      print(e.toString());
    });
  }

  void SportsData() {
    emit(SportsProgressIndicator());

    DoiHelper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'Sports',
          'apiKey': '3f730f6753974215b6b771cdb6c5b8cc',
        }).then((value) {
        Sportslist = value.data['articles'];

      emit(SportsSuccess());
    }).catchError((e) {
      emit(SportsFail());
      print(e.toString());
    });
  }

  void SienceData() {
    emit(SienceProgressIndicator());

    DoiHelper.getdata(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'Science',
          'apiKey': '3f730f6753974215b6b771cdb6c5b8cc',
        }).then((value) {
        Siencelist = value.data['articles'];

      emit(SienceSuccess());
    }).catchError((e) {
      emit(SienceFail());
      print(e.toString());
    });
  }

  void searchData(String value) {


    SearchList = [];

    emit(SearchProgressIndicator());
    DoiHelper.getdata(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey': '1952daf17b4e419aba1409f94557dbea',
        }).then((value) {
       SearchList= value.data['articles'];
      emit(SearchSuccess());
    }).catchError((e) {
      emit(SearchFail());
      print(e.toString());
    });
  }


}
