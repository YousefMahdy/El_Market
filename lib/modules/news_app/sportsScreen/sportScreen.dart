
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/layout/news_App/cubit/cubit.dart';
import 'package:jooo/layout/news_App/cubit/states.dart';
import 'package:jooo/shared/components/components.dart';

class SportScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStetes>(
      listener: (context,stste){},
      builder:  (context,stste){
        List<dynamic> sports=NewsCubit.get(context).sportArticles;
        return articleBuilder(sports);

      },

    );

  }
}
