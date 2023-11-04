import 'package:flutter/material.dart';
import 'package:news_app/ui/utilits/app_assets.dart';
import 'package:news_app/ui/utilits/app_color.dart';

class CategoryDM{
String id;
String title;
String imagePath;
Color backgroundColor;
bool isLeftSide;
CategoryDM({required this.id,
  required this.title,
  required this.backgroundColor,
  required this.imagePath,
  required this.isLeftSide});
static List<CategoryDM> categories= [
  CategoryDM(id: "sports", title: "Sports",
      backgroundColor: AppColor.sports, imagePath: AppAssets.sports,
      isLeftSide: true),
  CategoryDM(id: "technology", title: "Technology",
      backgroundColor: AppColor.politics, imagePath: AppAssets.politics,
      isLeftSide: false),
  CategoryDM(id: "health", title: "Health",
      backgroundColor: AppColor.health, imagePath: AppAssets.health,
      isLeftSide: true),
  CategoryDM(id: "business", title: "Business",
      backgroundColor: AppColor.bussines, imagePath: AppAssets.bussines,
      isLeftSide: false),
  CategoryDM(id: "entertainment", title: "Entertainment",
      backgroundColor: AppColor.environment, imagePath: AppAssets.environment,
      isLeftSide: true),
  CategoryDM(id: "science", title: "Science",
      backgroundColor: AppColor.science, imagePath: AppAssets.science,
      isLeftSide: false),
];
}