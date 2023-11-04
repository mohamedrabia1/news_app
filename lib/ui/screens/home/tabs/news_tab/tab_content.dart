import 'package:flutter/material.dart';
import 'package:news_app/data/api_manger.dart';
import 'package:news_app/model/articales_responces_dm.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/ui/utilits/app_color.dart';

class TabContent extends StatelessWidget{
SourcesDM sourcesDM;
TabContent(this.sourcesDM);

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<ArticalesResponcesDm>(
      future: ApiManager.getArticles(sourcesDM.id!),
      builder:(context,snapShot){
        if(snapShot.hasError){
          return Text(snapShot.error.toString());
        }else if(snapShot.hasData){
          return ListView.builder(
            itemCount: snapShot.data!.articles!.length,
              itemBuilder:(context,index){
              return buildNewsWidget(context,snapShot.data!.articles![index] );
              }
          );
        }else{
          return Center(child: CircularProgressIndicator());
        }
      } ,
    );

  }
  Widget buildNewsWidget(BuildContext context,ArticleDM articleDM){
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(12)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(fit: BoxFit.fill,height: MediaQuery.of(context).size.height*.25
                    ,articleDM.urlToImage ??
                    "https://previews.123rf.com/images/bluemoon1981/bluemoon19811609/bluemoon1981160900049/65555846-world-news-background-news-text-and-earth-globe-in-front-of-moving-directions.jpg"),
              ),
            ],
          ),
          SizedBox(height: 6),
          Text(articleDM.author??"",textAlign: TextAlign.start,style: TextStyle(fontSize: 12,
              color: AppColor.grey ),),
          SizedBox(height: 8),
          Text(articleDM.title??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
          SizedBox(height: 6),
          Text(articleDM.publishedAt??"",textAlign: TextAlign.end, style: TextStyle(fontSize: 12,
              color: AppColor.grey )),

        ],
      ),
    );
  }
}
