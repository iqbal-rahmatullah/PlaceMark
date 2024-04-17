import 'package:hive_flutter/hive_flutter.dart';
part 'bookmark.g.dart';

@HiveType(typeId: 1)
class Bookmark {
  @HiveField(0)
  int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String location;
  @HiveField(3)
  final String cover;
  @HiveField(4)
  final double rate;
  @HiveField(5)
  final String description;

  Bookmark({
    required this.id,
    required this.name,
    required this.cover,
    required this.rate,
    required this.location,
    required this.description,
  });
}
