import 'package:flutter/material.dart';
import 'package:news_app/data/api_manger.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/model/sources_response.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/tab_content.dart';
import 'package:news_app/ui/utilits/app_color.dart';

class NewsTab extends StatefulWidget {
  CategoryDM selectedCategory;
  NewsTab(this.selectedCategory);

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
int currentTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponseDM>(
        future: ApiManager.getSources(widget.selectedCategory.id),
        builder: (context , snapShot){
          if(snapShot.hasError){
            return Text(snapShot.error.toString());
          }else if(snapShot.hasData){
            return getScreenBody(snapShot.data!.sources!);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }
    );
  }

  Widget getScreenBody(List<SourcesDM> sources){
    return DefaultTabController(
        length: sources.length,
        child:Column(
          children: [
            SizedBox(height: 12,),
            TabBar(
              indicatorColor: AppColor.transparent,
              isScrollable: true,
                tabs: sources.map((source) {
              return getTab(source,currentTabIndex == sources.indexOf(source));
            }).toList(),
              onTap: (index){
                currentTabIndex = index;
                setState(() {});
              },
            ),
            Expanded(
              child: TabBarView(children: sources.map((source) {
                return TabContent(source);
              }).toList()
              ),
            ),
    ]
        )
    );
  }

  Widget getTab(SourcesDM source, bool isSelected){
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isSelected ? AppColor.primaryColor : AppColor.white,
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Text(source.name ?? "unKnown",style: TextStyle(
          color: isSelected ? AppColor.white : AppColor.primaryColor),),
    );
  }
}
