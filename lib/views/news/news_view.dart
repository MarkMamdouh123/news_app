import 'package:flutter/material.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';
import 'package:news_app/views/news/widgets/news_view_body.dart';
import 'package:news_app/widgets/custom_appbar.dart';
import 'package:news_app/widgets/custom_drawer.dart';
import 'package:news_app/widgets/search_appbar.dart';

class NewsView extends StatefulWidget {
  final String categoryId;

  const NewsView({required this.categoryId, super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  bool _searchSelected = true;

  void appBarChange() {
    setState(() {
      _searchSelected = !_searchSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: _searchSelected
            ? defaultBar(context, appBarChange, _key)
            : editingBar(context, appBarChange),
      ),
      drawer: const CustomDrawer(),
      body: FutureBuilder(
        future: ApiManager.getSources(widget.categoryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          var sourcesList = snapshot.data?.sources ?? [];
          if (sourcesList.isEmpty) {
            return const Center(child: Text("No Sources"));
          }
          return NewsTab(
            sources: sourcesList,
          );
        },
      ),
    );
  }
}
