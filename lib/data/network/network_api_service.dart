import 'dart:io';
import 'base_api_service.dart';
import '../app_exceptions.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getPostApiResponse(Link link, dynamic data) async {
    dynamic responseJson;
    try {
      GraphQLClient client = GraphQLClient(
        link: link,
        cache: GraphQLCache(store: HiveStore()),
      );

      QueryResult<Object?> result =
          await client.query(QueryOptions(document: gql(data)));

      responseJson = result.data;
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }

    return responseJson;
  }
}
