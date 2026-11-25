import 'package:crud_application_product/feature/product/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    required super.id,
    required super.name,
    required super.price,
    required super.stock,
    required super.image,
    super.createdAt,
    super.updatedAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      stock: (json['stock'] as num?)?.toInt() ?? 0,
      image: json['image']?.toString() ?? '',
      createdAt: json['createdAt'] == null ? null : DateTime.tryParse(json['createdAt']),
      updatedAt: json['updatedAt'] == null ? null : DateTime.tryParse(json['updatedAt']),
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id, 
      'name': name, 
      'price': price, 
      'stock': stock, 
      'image': image,
      'createdAt' : createdAt?.toIso8601String(),
      'updatedAt' : updatedAt?.toIso8601String(),
    };
  }
}
