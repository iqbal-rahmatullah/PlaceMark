import 'package:travel_indonesia_app/entities/destination_entities.dart';

class DestinationModel extends DestinationEntity {
  DestinationModel(
      {required super.id,
      required super.name,
      required super.category,
      required super.cover,
      required super.rate,
      required super.rateCount,
      required super.location,
      required super.description,
      required super.images,
      required super.facilities});

// For method get
  factory DestinationModel.fromJson(Map<String, dynamic> json) {
    return DestinationModel(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      cover: json['cover'],
      rate: json['rate'],
      rateCount: json['rate_count'],
      location: json['location'],
      description: json['description'],
      images: (json['images'] as String).split(", "),
      facilities: (json['facilities'] as String).split(", "),
    );
  }

// For methos post
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'cover': cover,
      'rate': rate,
      'rateCount': rateCount,
      'location': location,
      'description': description,
      'images': images.join(", "),
      'facilities': facilities.join(", "),
    };
  }

  DestinationEntity get toEntity => DestinationEntity(
        id: id,
        name: name,
        category: category,
        cover: cover,
        rate: rate,
        rateCount: rateCount,
        location: location,
        description: description,
        images: images,
        facilities: facilities,
      );
}
