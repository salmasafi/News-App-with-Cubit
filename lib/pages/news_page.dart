// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/news_cubit.dart';
import 'package:newsapp/widgets/category.dart';
import 'package:newsapp/widgets/news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CategoryListView(myCubit: context.read<NewsCubit>()),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 26,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is LoadedState) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: CategoryListView(myCubit: context.read<NewsCubit>()),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 26,
                    ),
                  ),
                  NewsListView(newsList: state.news)
                ],
              ),
            );
          } else {
            return Center(
              child: Text('There is something wrong'),
            );
          }
        },
      ),
    );
  }
}
