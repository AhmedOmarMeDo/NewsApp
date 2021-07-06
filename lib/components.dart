
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/layouts/cubit/nCubit.dart';
import 'package:newsapp/modules/web_view/webview.dart';


Widget CreateListItem(article,context){
  Size size = MediaQuery.of(context).size;
  return Padding(
      padding: EdgeInsets.only(left: 14,right: 15,top: 5),
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context,index){
          return Divider( thickness: .8, color: Colors.grey);
        },
        itemCount: article.length ,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => WebbView(url: article[index]['url'],)));
            },
            child: Row(
              children: [
                Container(

                  width: size.width * .42,
                  height: size.height * .16,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage('${article[index]['urlToImage']}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * .03,
                ),
                Expanded(
                  child: Container(
                    height: size.height * .16,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            '${article[index]['title']} ',
                            style: Theme.of(context).textTheme.bodyText1,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text('${article[index]['publishedAt']}',
                          style:  TextStyle(
                            color: Colors.grey,
                          ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      )
  );
}