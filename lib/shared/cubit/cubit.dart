import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/shared/cubit/states.dart';
import 'package:jooo/shared/network/local/cashe_helper.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/loginModel.dart';
import '../network/end_points.dart';
import '../network/remote/dio_Helper.dart';

class AppCubit extends Cubit<AppStetes> {
  AppCubit() : super(AppInitialState());
  var current_index = 0;
  List<String> title = ["New Tasks", "Done Tasks", "Archived Tasks"];

  late List<Map> tasks = [];
  late List<Map> newTasks = [];
  late List<Map> doneTasks = [];
  late List<Map> archiveTasks = [];
  late Database database;
  bool isButtomSheetShown = false;

  static AppCubit get(context) => BlocProvider.of(context);

  changIndex(index) {
    current_index = index;
    emit(AppChangButtomNavBarStste());
  }

  changButtomSheetState({
    required bool isButomSheetShown,
  }) {
    isButtomSheetShown = isButomSheetShown;
    emit(ChangButtomSheetState());
  }

  void creatDatabase() async {
    openDatabase("todo.db", version: 1, onCreate: (database, version) {
      print("data created");
      database
          .execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT,status TEXT)')
          .then((value) {
        print("table created");
      }).catchError((error) {
        print("error is ${error.toString()}");
      });
    }, onOpen: (database) {
      getData(database);
    }).then((value) {
      database = value;
      print("$value  ");
      // emit(AppCreatDataBaseState());
    });
    print("data opend");
  }

  insertToDatabase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO tasks(title, date, time,status) VALUES("$title", "$date", "$time","new")')
          .then((value) {
        print('inserted1 roooooooow : ${value}');
        getData(database);
      }).catchError((error) {
        print("error isssssssssssss $error");
      });
    });
  }

  void getData(database) async {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AppDataBaseLoadingState());
    return await database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element["status"] == "new")
          newTasks.add(element);
        else if (element["status"] == "done")
          doneTasks.add(element);
        else
          archiveTasks.add(element);


        print(element["status"]);
      });
      emit(AppGetDataBaseState());
    });
  }

  void updateDatabase({
    required String status,
    required int id
  }) async {
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {
      getData(database);
      emit(AppUpdateDataBaseState());
    });
  }

  void deleteDatabase({

    required int id
  }) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      getData(database);
      emit(AppDeleteDataBaseState());
    });
  }

  bool isDark = false;

  void changDarkMode(bool isDarkStored) {

    isDark = isDarkStored;
    print('value  is $isDark');
    CasheHelper.setData(key: "isDark", value: isDark).then((value) {
      // print('value to insert $x');
      emit(ChangeDarckModeState());
    }).catchError((e) {
      print(e.toString());
    });
  }
  ShopLoginModel ?userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(
      path:  PROFILE,

    ).then((value) {
      userModel = ShopLoginModel.fromJson(value.data);
      print(userModel!.data!.name);

      emit(ShopSuccessUserDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }
}
