
import 'package:flutter/material.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_tab.dart';
import 'package:news_app/ui/screens/home/tabs/setting_tab/setting_tab.dart';
import 'package:news_app/ui/utilits/app_color.dart';



class HomeScreen extends StatefulWidget {
  static const routeName = "news";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryDM? selectedCategory = null;
  late Widget selectedTab;
  @override
  void initState() {
    super.initState();
    selectedTab = CategoriesTab(setSelectedCategory);
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        if(selectedTab is CategoriesTab){
          return Future.value(true);
        }else{
          selectedTab = CategoriesTab(setSelectedCategory);
          setState(() {});
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
              bottomRight:Radius.circular(20) ,bottomLeft: Radius.circular(20))),
          title:  Text("News"),
          centerTitle: true,
          actions: selectedTab is NewsTab?[
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(onPressed: (){

              },
                  icon: Icon(Icons.search,size: 30)),
            )
          ]
              :null,
        ),
        body: selectedTab,
        drawer: bulidDrawerWidget(),
      ),
    );
  }


  void setSelectedCategory(CategoryDM categoryDM){
    selectedCategory = categoryDM;
    selectedTab = NewsTab(selectedCategory!);
    setState(() {});
  }


  Widget bulidDrawerWidget() {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: AppColor.primaryColor,
            height: MediaQuery.of(context).size.height*.20,
            child: Center(
              child: Text("News App!",style: TextStyle(color: AppColor.white,
                  fontSize: 22,fontWeight: FontWeight.bold),),
            ),

          ),
          SizedBox(height: 8,),
          InkWell(
            onTap: (){
              selectedCategory = null;
              selectedTab = CategoriesTab(setSelectedCategory);
              Navigator.pop(context);
              setState(() {});
            },
              child: bulidDrawerRow(Icons.menu, "Categories")),
          InkWell(
            onTap: (){
              selectedTab = SettingTab();
              Navigator.pop(context);
              setState(() {});
            },
              child: bulidDrawerRow(Icons.settings,"Settings")),

        ],
      ),
    );
  }

  Widget bulidDrawerRow(IconData icon , String text){
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon,size: 24,),
          SizedBox(width: 8),
          Text(text,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}


