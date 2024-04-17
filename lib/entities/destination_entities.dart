// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DestinationEntity extends Equatable {
  final int id;
  final String name;
  final String category;
  final String cover;
  final double rate;
  final int rateCount;
  final String location;
  final String description;
  final List<String> images;
  final List<String> facilities;

  DestinationEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.cover,
    required this.rate,
    required this.rateCount,
    required this.location,
    required this.description,
    required this.images,
    required this.facilities,
  });

  @override
  List<Object> get props {
    return [
      id,
      name,
      category,
      cover,
      rate,
      rateCount,
      location,
      description,
      images,
      facilities,
    ];
  }
}
