import 'package:newsapp/modules/serach/search.dart';

abstract class NewsStates {}

class ChangeMode extends NewsStates {}

class InitialState extends NewsStates {}

class ChangeState extends NewsStates {}

class BuisnesProgressIndicator extends NewsStates {}

class BuisnessSuccess extends NewsStates {}

class BuisnessFail extends NewsStates {
  var fail;

  BuisnessFail({this.fail});
}

class SportsProgressIndicator extends NewsStates {}

class SportsSuccess extends NewsStates {}

class SportsFail extends NewsStates {
  var fail;

  SportsFail({this.fail});
}

////

 class SienceProgressIndicator extends NewsStates {}

class SienceSuccess extends NewsStates {}

class SienceFail extends NewsStates {
  var fail;

  SienceFail({this.fail});
}


class SearchProgressIndicator extends NewsStates {}

class SearchSuccess extends NewsStates {}

class SearchFail extends NewsStates {
  var fail;

  SearchFail({this.fail});
}


