import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../modules/search/search_screen.dart';
import '../shared/components/components.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class ShopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     ShopCubit cubit=ShopCubit.get(context);


    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (contxt, state) {
        if (state is ShopSuccessFavoritesState) {
          if (!state.changeFavoritesModel.status) {
            showToast(
              state: ToastStates.ErrOR,
              message: state.changeFavoritesModel.message,
            );
          }
        }
      },
      builder: (contxt, state) => Scaffold(
        appBar: AppBar(
          title: Text("El Market"),

          actions: [
            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                  // ShopCubit.get(context)
                },
                icon: Icon(Icons.search_outlined)),

            IconButton(
                padding: EdgeInsets.all(0),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                  // ShopCubit.get(context)
                },
                icon: Icon(
                  
                    Icons.shopping_cart))
          ],
        ),
        body: cubit.screens[cubit.current_index],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_sharp,
              ),
              label: 'HOME',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.apps,
              ),
              label: 'CATEGORIES',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_outlined,
              ),
              label: 'FAVORITS',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
              ),
              label: 'SETTINGS',
            ),
          ],
          type: BottomNavigationBarType.fixed,
          elevation: 15,
          onTap: (index) {
            cubit.changIndex(index);
          },
          currentIndex: cubit.current_index,
        ),
      ),
    );
  }
}
