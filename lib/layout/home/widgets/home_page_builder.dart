import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant_app/layout/home/widgets/build_category_item.dart';
import 'package:my_restaurant_app/layout/home/widgets/grid_view_item.dart';
import 'package:my_restaurant_app/layout/models/categories_model.dart';
import 'package:my_restaurant_app/layout/models/home_model.dart';

Widget homePageBuilderWidget(HomeModel model, CategoriesModel categoriesModel,context){
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model.data!.banners!.map((e) => Image(
              image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            )).toList(),
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal
            ),
        ),
        SizedBox(height: 10,),
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 10),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text('Categories',
               style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w800
               ),
             ),
             SizedBox(height: 10,),
             Container(
               height: 100,
               child: ListView.separated(
                 physics: BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                 itemBuilder:(context,index)=>buildCategoryItemWidget(categoriesModel.data!.data![index],context) ,
                 separatorBuilder:(context,index)=>SizedBox(width: 10,) ,
                 itemCount: categoriesModel.data!.data!.length,
               ),
             ),
             SizedBox(height: 10,),
             Text('New Products',
               style: TextStyle(
                   fontSize: 24,
                   fontWeight: FontWeight.w800
               ),
             ),
           ],
         ),
       ),
        SizedBox(height: 20,),
        Container(
          color: Colors.grey[300],
          child: GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            childAspectRatio: 1/1.72,
            children: List.generate(
                model.data!.products!.length,
                    (index) => buildGridProduct(model.data!.products![index],context)),
          ),
        )
      ],
    ),
  );
}