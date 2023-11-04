import 'package:flutter/material.dart';
import 'package:news_app/model/category_dm.dart';
import 'package:news_app/ui/screens/home/tabs/categories/category.dart';

class CategoriesTab extends StatelessWidget {
  Function(CategoryDM) onCategoryClick;
  CategoriesTab(this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Pick your category of interest",style: TextStyle(fontSize: 22),),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount: 2,
                 mainAxisSpacing: 20,
                 crossAxisSpacing: 20
               ),
              itemCount: 6,
                itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    onCategoryClick(CategoryDM.categories[index]);
                  },
                  child : Category(CategoryDM.categories[index]),
                );
                }
            ),
          ),
        )
      ],
    );
  }
}
