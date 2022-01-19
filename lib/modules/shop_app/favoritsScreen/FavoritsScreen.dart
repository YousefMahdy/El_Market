import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jooo/shared/components/components.dart';

import '../../../layout/shopLayout/cubit/cubit.dart';
import '../../../layout/shopLayout/cubit/states.dart';


class FavoritsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        return ConditionalBuilder(
          condition: ShopCubit.get(context).favoritesModel!=null,
          builder: (context) => ListView.separated(
            //
            itemBuilder: (context, index) => buildListProduct( ShopCubit.get(context).favoritesModel!.data!.data[index].product,context),
            separatorBuilder: (context, index) => BuildSeperatItem(),
            itemCount:ShopCubit.get(context).favoritesModel!.data!.data.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }


  // Widget buildListProduct(
  //   Product?  product,
  //     context, {
  //       bool isOldPrice = true,
  //     }) =>
  //     Padding(
  //       padding: const EdgeInsets.all(20.0),
  //       child: Container(
  //         height: 120.0,
  //         child: Row(
  //           children: [
  //             Stack(
  //               alignment: AlignmentDirectional.bottomStart,
  //               children: [
  //                 Image(
  //                   image: NetworkImage(product!.image),
  //
  //                   width: 120.0,
  //                   height: 120.0,
  //                 ),
  //                 if (product.discount != 0 && isOldPrice)
  //                   Container(
  //                     color: Colors.red,
  //                     padding: EdgeInsets.symmetric(
  //                       horizontal: 5.0,
  //                     ),
  //                     child: Text(
  //                       'DISCOUNT',
  //                       style: TextStyle(
  //                         fontSize: 8.0,
  //                         color: Colors.white,
  //                       ),
  //                     ),
  //                   ),
  //               ],
  //             ),
  //             SizedBox(
  //               width: 20.0,
  //             ),
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Text(
  //                     product.name,
  //                     maxLines: 2,
  //                     overflow: TextOverflow.ellipsis,
  //                     style: TextStyle(
  //                       fontSize: 14.0,
  //                       height: 1.3,
  //                     ),
  //                   ),
  //                   Spacer(),
  //                   Row(
  //                     children: [
  //                       Text(
  //                         product.price.toString(),
  //                         style: TextStyle(
  //                           fontSize: 12.0,
  //                           color: defaultColor,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         width: 5.0,
  //                       ),
  //                       if (product.discount != 0 && isOldPrice)
  //                         Text(
  //                           product.oldPrice.toString(),
  //                           style: TextStyle(
  //                             fontSize: 10.0,
  //                             color: Colors.grey,
  //                             decoration: TextDecoration.lineThrough,
  //                           ),
  //                         ),
  //                       Spacer(),
  //                       IconButton(
  //                         onPressed: () {
  //
  //                           print(ShopCubit.get(context).favoritesModel!.data!.data.length);
  //                           ShopCubit.get(context).addOrDeleteFavorits(product_id: product.id);
  //                         },
  //                         icon: CircleAvatar(
  //                           radius: 15.0,
  //                           backgroundColor:
  //                            ShopCubit.get(context).favorites[product.id]!
  //                                ? defaultColor
  //                               : Colors.grey,
  //                           child: Icon(
  //                             Icons.favorite_border,
  //                             size: 14.0,
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );



}
