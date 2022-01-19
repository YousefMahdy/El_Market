import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/cubit/cubit.dart';
import 'layout/shopLayout.dart';
import 'modules/login/shop_logIn.dart';
import 'modules/on_boarding/on_boarding_screen.dart';
import 'shared/bloc_Observer.dart';
import 'shared/components/constants.dart';
import 'shared/cubit/cubit.dart';
import 'shared/cubit/states.dart';
import 'shared/network/local/cashe_helper.dart';
import 'shared/network/remote/dio_Helper.dart';
import 'shared/stylse/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //make all run befor runApp


  DioHelper.init();
  await CasheHelper.init();
  var isDark = CasheHelper.getData(key: 'isDark');
  token = CasheHelper.getData(key: 'token')??'';
  var onBoarding = CasheHelper.getData(key: "onBoarding");
  Widget widget;
  if(onBoarding!=null){
    if(token!=''){
      widget=ShopLayout();
    }else widget=ShopLogin();
  }else widget=OnBoardingScreen();
  print("from shared $isDark");


  // var len = foo?.length ?? 0;
  BlocOverrides.runZoned(
    () {
      runApp(MyApp( isDark??false ,widget));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  bool isDark = false;
  Widget widget;
  MyApp (this.isDark, this.widget);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [

        BlocProvider(
            create: (BuildContext context) => AppCubit()
           //   ..changDarkMode(isDark)
        ),
        BlocProvider(
            create: (BuildContext context) => ShopCubit()
              ..getHomeData()
              ..geCategoriesData()
              ..getFavoritesData()
              ..getUserData()
        )
      ],
      child: BlocConsumer<AppCubit, AppStetes>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
              debugShowCheckedModeBanner: false,
              home:widget,
            );
          }),
    );
  }
}
