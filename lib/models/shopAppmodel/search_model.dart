class SearchModel
{
  late bool status;
 // late Null message;
  Data ?data;

  SearchModel.fromJson(Map<String, dynamic> json)
  {
    status = json['status'];
   // message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
 // late  int currentPage;
  List<Product> data=[];
  // late String firstPageUrl;
  // late int from;
  // late int lastPage;
  // late String lastPageUrl;
  // late String path;
  // late int perPage;
  // late int to;
  // late int total;

  Data.fromJson(Map<String, dynamic> json) {
   // currentPage = json['current_page'];
    if (json['data'] != null) {

      json['data'].forEach((v) {
        data.add( Product.fromJson(v));
      });
    }
    // firstPageUrl = json['first_page_url'];
    // from = json['from'];
    // lastPage = json['last_page'];
    // lastPageUrl = json['last_page_url'];
    //
    // path = json['path'];
    // perPage = json['per_page'];
    // to = json['to'];
    // total = json['total'];
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
    discount = json['discount']??0;
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['id'] = this.id;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['discount'] = this.discount;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}