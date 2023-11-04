import 'package:flutter/material.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/ui/utilits/app_color.dart';

class Category extends StatelessWidget {
  CategoryDM categoryDM;
  Category(this.categoryDM);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12) ,
          topRight: Radius.circular(12) ,
          bottomRight: categoryDM.isLeftSide ? Radius.zero : Radius.circular(12),
          bottomLeft: categoryDM.isLeftSide ? Radius.circular(12) :Radius.zero
        ),
        color: categoryDM.backgroundColor
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Spacer(),
           Image.asset(categoryDM.imagePath),
           Spacer(),
           Text(categoryDM.title,style: TextStyle(fontWeight: FontWeight.bold,
               fontSize: 18,color: AppColor.white),),
         ],
      ),
    );
  }
}
