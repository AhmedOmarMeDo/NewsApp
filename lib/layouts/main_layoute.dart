import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/cubit/Cubit.dart';
import 'package:newsapp/layouts/cubit/States.dart';
import 'package:newsapp/layouts/cubit/nCubit.dart';
import 'package:newsapp/modules/serach/search.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'NewsApp',
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.brightness_6),
                onPressed: (){
                  AppCubit.get(context).changemood();
                },
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder:(context) => Search(),),);
                },
                iconSize: 32,
              ),

            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: NewsCubit.get(context).navBarIt,
            currentIndex: NewsCubit.get(context).currentIndex,
            onTap: (index) {
              NewsCubit.get(context).changestate(index);
            },
          ),
          body: NewsCubit.get(context)
              .screens[NewsCubit.get(context).currentIndex],
        );
      },
    );
  }
}
