import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/layout/news_App/cubit/cubit.dart';
import 'package:jooo/layout/news_App/cubit/states.dart';
import 'package:jooo/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStetes>(
      listener: (context, stste) {},
      builder: (context, stste) {
        List<dynamic> searches = NewsCubit.get(context).searchArticles;
        return Scaffold(
          appBar: AppBar(
            title: Text("search"),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controler: searchController,
                    validat: (s) {},
                    keyboardType: TextInputType.text,
                    labelText: "search",
                    prefexIcon: Icons.search_outlined,
                    // onChange: (value) {
                    //   NewsCubit.get(context).getSearchData(value);
                    // }
                   ),
              ),
              Expanded(
                  child: articleBuilder(searches,isSearch: true)),

            ],
          ),
        );
      },
    );
  }
}
