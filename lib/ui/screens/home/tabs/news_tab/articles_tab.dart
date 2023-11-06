import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/data/api_manger.dart';
import 'package:news_app/model/articales_responces_dm.dart';
import 'package:news_app/model/sources_response.dart';

import 'articales_widget.dart';

class ArticlesTab extends StatefulWidget{
SourcesDM sourcesDM;
ArticlesTab(this.sourcesDM);

  @override
  State<ArticlesTab> createState() => _ArticlesTabState();
}

class _ArticlesTabState extends State<ArticlesTab> {
  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<ArticalesResponcesDm>(
      future: ApiManager.getArticles(sourceId: widget.sourcesDM.id!),
      builder:(context,snapShot){
        if(snapShot.hasError){
          return Text(snapShot.error.toString());
        }else if(snapShot.hasData){
          return buildListView(snapShot.data!.articles!);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      } ,
    );

  }
  Widget buildListView(List<ArticleDM> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index){
          return ArticalesWidget(articles[index]);
        });
  }
}
