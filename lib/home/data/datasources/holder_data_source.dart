import 'package:dio/dio.dart';
import 'package:tesing/home/data/models/place_holder.dart';
import 'package:tesing/common/app_links.dart';

abstract class IHolderDataSource{
  Future<List<PlaceHolder>> getFromHolder(int page);
}

class HolderDataSource implements IHolderDataSource{
  @override
  Future<List<PlaceHolder>> getFromHolder(int page) async {
    try {
      var response = await Dio()
          .get("${AppLinks.shared.placeHolderLink}?_page=$page");
      return (response.data as List)
          .map((e) => PlaceHolder.fromJson(e))
          .toList();
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}
