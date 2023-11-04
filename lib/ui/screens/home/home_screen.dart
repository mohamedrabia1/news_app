
import 'package:flutter/material.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories/categories_tab.dart';
import 'package:news_app/ui/screens/home/tabs/news_tab/news_tab.dart';
import 'package:news_app/ui/utilits/app_color.dart';



class HomeScreen extends StatefulWidget {
  static const routeName = "news";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryDM? selectedCategory = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(
            bottomRight:Radius.circular(20) ,bottomLeft: Radius.circular(20))),

        title:  Text("News"),
        centerTitle: true,
      ),
      body: selectedCategory == null ? CategoriesTab(setSelectedCategory)
          : NewsTab(selectedCategory!),
      drawer: bulidDrawerWidget(),
    );
  }


  void setSelectedCategory(CategoryDM categoryDM){
    selectedCategory = categoryDM;
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
              Navigator.pop(context);
              setState(() {});
            },
              child: bulidDrawerRow(Icons.menu, "Categories")),
          InkWell(
            onTap: (){},
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


