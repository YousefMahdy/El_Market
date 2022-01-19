// class FavoritesModel {
//
//
//   late final bool status;
//   //late final Null message;
//   late final Data data;
//
//   FavoritesModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//    // message = null;
//     data = Data.fromJson(json['data']);
//   }
//
//
// }
//
// class Data {
//
//   //late final int currentPage;
//   late final List<Data> data;
//   late final String firstPageUrl;
//   late final int from;
//   late final int lastPage;
//   late final String lastPageUrl;
//  // late final Null nextPageUrl;
//   late final String path;
//   late final int perPage;
//  // late final Null prevPageUrl;
//   late final int to;
//   late final int total;
//
//   Data.fromJson(Map<String, dynamic> json){
//    // currentPage = json['current_page'];
//     data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//    // nextPageUrl = null;
//     path = json['path'];
//     perPage = json['per_page'];
//    // prevPageUrl = null;
//     to = json['to'];
//     total = json['total'];
//   }
//
//
// }
class FavoritesModel
{
  late bool status;

  Data? data;

  FavoritesModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];

    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  late int currentPage;
   List<FavoritesData> data=[];
  late String firstPageUrl;
  late int from;
  late int lastPage;
  late String lastPageUrl;
  late String path;
  late int perPage;

  late int to;
  late int total;

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {

      json['data'].forEach((v) {
        data.add( FavoritesData.fromJson(v));

      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];

    path = json['path'];
    perPage = json['per_page'];

    to = json['to'];
    total = json['total'];
  }
}

class FavoritesData {
  late int id;
  Product? product;

  FavoritesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }
}

class Product {
  late int id;
  late dynamic price;
  late dynamic oldPrice;
  late int discount;
  late String image;
  late String name;
  late String description;

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['price'] = this.price;
  //   data['old_price'] = this.oldPrice;
  //   data['discount'] = this.discount;
  //   data['image'] = this.image;
  //   data['name'] = this.name;
  //   data['description'] = this.description;
  //   return data;
  // }
}
