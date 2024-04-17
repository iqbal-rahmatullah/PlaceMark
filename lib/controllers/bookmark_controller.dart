import 'dart:ffi';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_indonesia_app/error/exception.dart';
import 'package:travel_indonesia_app/models/bookmark.dart';

class BookmarkController {
  final String bookmark = 'bookmark';

  late Box<Bookmark> bookmarkBox;

  void addBookmark(Bookmark item) async {
    try {
      bookmarkBox = await Hive.openBox<Bookmark>(bookmark);
      var id = bookmarkBox.values.map((e) => e.id).toList();
      id.sort();

      item.id = id.isEmpty ? 1 : id.last + 1;
      bookmarkBox.add(item);
    } catch (e) {
      throw ServerException();
    }
  }

  Future<List<Bookmark>> getAll() async {
    try {
      bookmarkBox = await Hive.openBox<Bookmark>(bookmark);
      return bookmarkBox.values.toList();
    } catch (e) {
      throw ServerException();
    }
  }

  void deleteBookmark(int id) async {
    try {
      bookmarkBox = await Hive.openBox<Bookmark>(bookmark);
      bookmarkBox.keys.forEach((key) {
        var bookmark = bookmarkBox.get(key);
        if (bookmark != null && bookmark.id == id) {
          bookmarkBox.delete(key);
        }
      });
    } catch (e) {
      throw ServerException();
    }
  }

  void clearBookmark() async {
    bookmarkBox = await Hive.openBox<Bookmark>(bookmark);
    bookmarkBox.clear();
  }
}
