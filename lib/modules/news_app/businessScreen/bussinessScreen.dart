
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/layout/news_App/cubit/cubit.dart';
import 'package:jooo/layout/news_App/cubit/states.dart';
import 'package:jooo/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStetes>(

      listener: (context,stste){},
      builder:  (context,stste){
        List<dynamic> business=NewsCubit.get(context).businessArticles;
        return articleBuilder(business);


      },

    );

  }
}
