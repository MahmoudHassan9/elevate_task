
import '../../domain/entity/product_entity.dart';
import '../../domain/entity/rating.dart';


class Product extends ProductEntity {
  Product.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }

}
