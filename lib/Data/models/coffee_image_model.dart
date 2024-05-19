import '../../Domain/entities/coffee_image.dart';

class CoffeeImageModel extends CoffeeImage {
  CoffeeImageModel({required super.imageUrl});

  factory CoffeeImageModel.fromJson(Map<String, dynamic> json) {
    return CoffeeImageModel(
      imageUrl: json['file'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'file': imageUrl,
    };
  }
}
