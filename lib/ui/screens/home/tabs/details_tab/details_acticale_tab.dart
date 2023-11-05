import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/articales_responces_dm.dart';
import 'package:news_app/ui/screens/web_view/web_view_screen.dart';
import 'package:news_app/ui/utilits/app_color.dart';
import 'package:timeago/timeago.dart' as timeago;

class DetailsArticaleTab extends StatefulWidget {

  static const routeName = "details";
  @override
  State<DetailsArticaleTab> createState() => _DetailsArticaleTabState();
}

class _DetailsArticaleTabState extends State<DetailsArticaleTab> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as ArticleDM;
    return  Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomRight:Radius.circular(20) ,bottomLeft: Radius.circular(20))),

        title:  Text("News Title"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
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
                    imageUrl:args.urlToImage??"",
                    placeholder: (_,__) => Center(child: CircularProgressIndicator()),
                    errorWidget: (_,__,___)=> Image.network("https://previews.123rf.com/images/bluemoon1981/bluemoon19811609/bluemoon1981160900049/65555846-world-news-background-news-text-and-earth-globe-in-front-of-moving-directions.jpg"),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(args.author??"",textAlign: TextAlign.start,style: TextStyle(fontSize: 12,
                color: AppColor.grey ),),
            SizedBox(height: 8),
            Text(args.title??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(height: 6),
            
            Text(timeago.format(DateTime.parse(args.publishedAt??""),allowFromNow: true)
               ,textAlign: TextAlign.end, style: TextStyle(fontSize: 12,
                color: AppColor.grey )),
            SizedBox(height: 8),
            SingleChildScrollView(
              child: Text(args.description??"",style: TextStyle(fontSize: 16,color: AppColor.grey) ,),
            ),
            Spacer(),
            InkWell(
                onTap: (){
                 Navigator.pushNamed(context, WebViewScreen.routeName,
                     arguments: args.url??"");
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("View Full Article",textAlign: TextAlign.end),
                      Icon(Icons.arrow_right,color: AppColor.black,)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );

  }
}
