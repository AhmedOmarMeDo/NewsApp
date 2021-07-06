import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/layouts/cubit/Cubit.dart';
import 'package:newsapp/layouts/cubit/States.dart';
import 'package:newsapp/layouts/cubit/nCubit.dart';
import 'package:newsapp/layouts/cubit/nState.dart';
import 'package:newsapp/layouts/main_layoute.dart';
import 'package:newsapp/networks/dio.dart';
import 'package:newsapp/networks/shared_prefer.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserver();
  DoiHelper.intit();
  await SharedPref.init();
  
  bool isDark = SharedPref.getbool("isDark");

  runApp(MyApp(isDark));
}



class MyApp extends StatelessWidget {

  bool isDark ;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..changemood(isdrk: isDark,),),
        BlocProvider(create: (context) => NewsCubit()
          ..BuisnessData()
          ..SienceData()
          ..SportsData(), ),
      ],
      child: BlocConsumer<AppCubit , AppStates>(
        listener: (context,state){},
        builder: (context,state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.deepOrange,
                selectedLabelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                selectedIconTheme: IconThemeData(size: 30),
                type: BottomNavigationBarType.fixed,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(color: Colors.black),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                color: Colors.white,
                elevation: 0.0,
              ),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                elevation: 20,
                backgroundColor: HexColor('323232'),
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                selectedLabelStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                selectedIconTheme: IconThemeData(size: 30),
                type: BottomNavigationBarType.fixed,
              ),
              scaffoldBackgroundColor: HexColor('323232'),
              appBarTheme: AppBarTheme(
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
                titleSpacing: 20,
                iconTheme: IconThemeData(color: Colors.white),
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                color: HexColor('323232'),
                elevation: 0.0,
              ),
            ),
            themeMode: AppCubit.get(context).isdark ? ThemeMode.dark : ThemeMode.light,
            home: MainScreen(),
          );
        },
      ),
    );
  }
}
