
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/shared/components/components.dart';
import 'package:jooo/shared/cubit/cubit.dart';
import 'package:jooo/shared/cubit/states.dart';

class Done extends StatelessWidget {
  // const Tasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStetes>(
      listener: (context,stats){},
      builder: (context,stats){
        var tasks =AppCubit.get(context).doneTasks;


        return ListView.separated(
              itemBuilder: (context,index)=> buildTaskItem(tasks[index],context),
            separatorBuilder: (context,index)=>Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
            ),
            itemCount: tasks.length);
      },

    );
  }
}
