import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

// **************************************************************************
// Widgets API Service
// **************************************************************************

  @POST('/api/auth/register')
  Future<dynamic> register();

  @GET('/api/widgets')
  Future<List<String>> getAllWidgets();
}
