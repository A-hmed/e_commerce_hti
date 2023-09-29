import 'package:e_commerce_hti/domain/model/response/categories_response.dart';
import 'package:e_commerce_hti/domain/model/response/meta_data.dart';
import 'package:e_commerce_hti/domain/model/response/sub_category.dart';

class ProductsResponse {
  int? results;
  Metadata? metadata;
  List<Product>? data;

  ProductsResponse({this.results, this.metadata, this.data});

  ProductsResponse.fromJson(dynamic json) {
    results = json["results"];
    metadata =
        json["metadata"] != null ? Metadata.fromJson(json["metadata"]) : null;
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["results"] = results;
    if (metadata != null) {
      map["metadata"] = metadata?.toJson();
    }
    if (data != null) {
      map["data"] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Product {
  int? sold;
  List<String>? images;
  List<Subcategory>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  Category? category;
  Category? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  Product(
      {this.sold,
      this.images,
      this.subcategory,
      this.ratingsQuantity,
      this.id,
      this.title,
      this.slug,
      this.description,
      this.quantity,
      this.price,
      this.imageCover,
      this.category,
      this.brand,
      this.ratingsAverage,
      this.createdAt,
      this.updatedAt});

  Product.fromJson(dynamic json) {
    sold = json["sold"];
    images = json["images"] != null ? json["images"].cast<String>() : [];
    if (json["subcategory"] != null) {
      subcategory = [];
      json["subcategory"].forEach((v) {
        subcategory?.add(Subcategory.fromJson(v));
      });
    }
    ratingsQuantity = json["ratingsQuantity"];
    id = json["_id"];
    title = json["title"];
    slug = json["slug"];
    description = json["description"];
    quantity = json["quantity"];
    price = json["price"];
    imageCover = json["imageCover"];
    category =
        json["category"] != null ? Category.fromJson(json["category"]) : null;
    brand = json["brand"] != null ? Category.fromJson(json["brand"]) : null;
    ratingsAverage = json["ratingsAverage"];
    createdAt = json["createdAt"];
    updatedAt = json["updatedAt"];
    id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["sold"] = sold;
    map["images"] = images;
    if (subcategory != null) {
      map["subcategory"] = subcategory?.map((v) => v.toJson()).toList();
    }
    map["ratingsQuantity"] = ratingsQuantity;
    map["_id"] = id;
    map["title"] = title;
    map["slug"] = slug;
    map["description"] = description;
    map["quantity"] = quantity;
    map["price"] = price;
    map["imageCover"] = imageCover;
    if (category != null) {
      map["category"] = category?.toJson();
    }
    if (brand != null) {
      map["brand"] = brand?.toJson();
    }
    map["ratingsAverage"] = ratingsAverage;
    map["createdAt"] = createdAt;
    map["updatedAt"] = updatedAt;
    map["id"] = id;
    return map;
  }
}
