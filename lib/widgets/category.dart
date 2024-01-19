// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:newsapp/cubit/news_cubit.dart';
import 'package:newsapp/objects/category_model.dart';
import 'package:newsapp/widgets/news.dart';

class CategoryListView extends StatelessWidget {
  final NewsCubit myCubit;
  CategoryListView({super.key, required this.myCubit});

  List<CategoryModel> category_list = [
    CategoryModel(
        categoryName: 'Technology', imageUrl: 'assets/technology.jpeg'),
    CategoryModel(categoryName: 'Health', imageUrl: 'assets/health.avif'),
    CategoryModel(categoryName: 'Science', imageUrl: 'assets/science.avif'),
    CategoryModel(categoryName: 'Business', imageUrl: 'assets/business.avif'),
    CategoryModel(
        categoryName: 'Entertainment', imageUrl: 'assets/entertaiment.avif'),
    CategoryModel(categoryName: 'Sports', imageUrl: 'assets/sports.avif'),
    CategoryModel(categoryName: 'General', imageUrl: 'assets/general.avif'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CategoryCard(
            category: category_list[index],
            myCubit: myCubit,
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 12,
        ),
        itemCount: category_list.length,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category, required this.myCubit});

  final NewsCubit myCubit;
  CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        categoryOption = category.categoryName;
        myCubit.getData();
        myCubit.emit(LoadedState(news: myCubit.news));
      },
      child: Container(
        height: 120,
        width: 200,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage(category.imageUrl)),
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Text(
            category.categoryName,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
