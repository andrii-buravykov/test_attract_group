import 'package:dio/dio.dart';
import 'package:tesing/common/app_constants.dart';
import 'package:tesing/common/pagination/pagination_result.dart';
import 'package:tesing/common/service/meta.dart';
import 'package:tesing/holder/data/models/place_holder.dart';
import 'package:tesing/common/service/api_exception.dart';
import 'package:tesing/common/app_links.dart';

abstract class IHolderDataSource {
  Future<PaginationResult<PlaceHolder>> getFromHolder(int page);
}

class HolderDataSource implements IHolderDataSource {
  @override
  Future<PaginationResult<PlaceHolder>> getFromHolder(int page) async {
    try {
      final response = await Dio().get(
        AppLinks.placeHolderLink,
        queryParameters: {'_page': page},
      );

      late final jsonList = response.data;
      if (jsonList is List) {
        return PaginationResult<PlaceHolder>(
          list: jsonList.map((e) => PlaceHolder.fromJson(e)).toList(),
          meta: Meta(
            currentPage: page + 1,
          ),
        );
      }
      throw ApiException(
        statusCode: response.statusCode ?? 0,
        errorMessage: AppConstants.unexpectedError,
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
