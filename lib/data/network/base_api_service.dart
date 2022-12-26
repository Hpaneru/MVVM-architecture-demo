import 'package:graphql_flutter/graphql_flutter.dart';

abstract class BaseApiServices {
  Future<dynamic> getPostApiResponse(Link link, dynamic data);
}
