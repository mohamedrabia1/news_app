import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articales_responces_dm.dart';
import 'package:news_app/ui/screens/home/tabs/details_tab/details_acticale_tab.dart';
import 'package:news_app/ui/utilits/app_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticalesWidget extends StatefulWidget {
  ArticleDM articleDM;
  ArticalesWidget(this.articleDM);

  @override
  State<ArticalesWidget> createState() => _ArticalesWidgetState();
}

class _ArticalesWidgetState extends State<ArticalesWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, DetailsArticaleTab.routeName,arguments: widget.articleDM );
        setState(() {});
      },
      child: Container(
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
                  child: CachedNetworkImage(
                    height: MediaQuery.of(context).size.height*.25,
                    fit: BoxFit.fill,
                    imageUrl:widget.articleDM.urlToImage??"",
                    placeholder: (_,__) => Center(child: CircularProgressIndicator()),
                    errorWidget: (_,__,___)=> Image.network("https://previews.123rf.com/images/bluemoon1981/bluemoon19811609/bluemoon1981160900049/65555846-world-news-background-news-text-and-earth-globe-in-front-of-moving-directions.jpg"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Text(widget.articleDM.author??"",textAlign: TextAlign.start,style: TextStyle(fontSize: 12,
                color: AppColor.grey ),),
            SizedBox(height: 8),
            Text(widget.articleDM.title??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(height: 6),
            Text(timeago.format(DateTime.parse(widget.articleDM.publishedAt??""),allowFromNow: true),textAlign: TextAlign.end, style: TextStyle(fontSize: 12,
                color: AppColor.grey )),

          ],
        ),
      ),
    );
  }
}
