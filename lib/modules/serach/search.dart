import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layouts/cubit/Cubit.dart';
import 'package:newsapp/layouts/cubit/States.dart';

import '../../components.dart';

class Search extends StatelessWidget {

  var controller  = TextEditingController();
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: BlocConsumer<NewsCubit,NewsStates>(

        listener: (context,state){},
        builder: (context,state){

          var list = NewsCubit.get(context).SearchList;
          return Scaffold(
            appBar: AppBar(),
            body:  Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: TextFormField(
                      onChanged: (String value ){
                        NewsCubit.get(context).searchData(value);
                      },
                      validator: (String value){
                        if(value.isEmpty){
                          return 'Enter valid search word';
                        }
                        return null;
                      },
                      controller: controller,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                          ),
                          labelText: 'Search',
                          hintText: 'Search Any thing'
                      ),
                    ),
                  ),
                  ConditionalBuilder(
                      condition: list.length > 0,
                      builder: (context){
                        return Expanded(child: CreateListItem(list,context));
                      },

                  )
                ],
              ),
          );
        }
      ),
    );
  }
}
