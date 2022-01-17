// class CtegoriesModel {
//   late final bool status;
//
//   late final Data data;
//   CtegoriesModel({
//     required this.status,
//
//     required this.data,
//   });
//
//
//   CtegoriesModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//
//     data = Data.fromJson(json['data']);
//   }
//
//
// }
//
// class Data {
//
//   late final int currentPage;
//   late final List<Data> data;
//   late final String firstPageUrl;
//   late final int from;
//   late final int lastPage;
//   late final String lastPageUrl;
//   late final Null nextPageUrl;
//   late final String path;
//   late final int perPage;
//   late final Null prevPageUrl;
//   late final int to;
//   late final int total;
//
//   Data.fromJson(Map<String, dynamic> json){
//     currentPage = json['current_page'];
//     data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     nextPageUrl = null;
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = null;
//     to = json['to'];
//     total = json['total'];
//   }
//
//
// }