import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel_indonesia_app/error/exception.dart';
import 'package:travel_indonesia_app/models/destination_model.dart';
import 'package:travel_indonesia_app/utils/api.dart';

abstract class DestinationRemoteDataSource {
  Future<List<DestinationModel>> all();
  Future<List<DestinationModel>> top();
  Future<List<DestinationModel>> search(String query);
}

class DestinationController implements DestinationRemoteDataSource {
  final http.Client client;

  DestinationController(this.client);

  @override
  Future<List<DestinationModel>> all() async {
    Uri url = Uri.parse("${apiData.baseUrl}/destination");
    final response = await client.get(url).timeout(Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body)["data"];
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> search(String query) async {
    Uri url = Uri.parse("${apiData.baseUrl}/destination/query");
    final response = await client.get(url).timeout(Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body)["data"];
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<DestinationModel>> top() async {
    Uri url = Uri.parse("${apiData.baseUrl}/destination/top");
    final response = await client.get(url).timeout(Duration(seconds: 3));
    if (response.statusCode == 200) {
      List list = jsonDecode(response.body)["data"];
      return list.map((e) => DestinationModel.fromJson(e)).toList();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else {
      throw ServerException();
    }
  }
}
