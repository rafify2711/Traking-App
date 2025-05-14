import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:tracking_app/core/utils/constants.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/apply_response.dart';
import 'package:tracking_app/features/auth/apply/data/models/get_all_vehicles_response/get_all_vehicles_response.dart';
import 'package:tracking_app/features/auth/login/data/model/login_request.dart';
import 'package:tracking_app/features/auth/login/data/model/login_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/forget_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/otp_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/request/reset_password_request.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/forget_password_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/otp_response.dart';
import 'package:tracking_app/features/auth/forget_password/data/models/response/reset_password_response.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(Constants.loginEndPoint)
  Future<LoginResponse> loginUser(@Body() LoginRequest loginRequest);

  @POST(Constants.forgetPasswordEndpoint)
  Future<ForgetPasswordResponse> forgetPassword(
    @Body() ForgetPasswordRequest forgetPasswordRequest,
  );
  @POST(Constants.verifyResetCodeEndpoint)
  Future<OtpResponse> verifyResetCode(@Body() OtpRequest otpRequest);
  @PUT(Constants.resetPasswordEndpoint)
  Future<ResetPasswordResponse> resetPassword(
    @Body() ResetPasswordRequest ResetPasswordRequest,
  );
  @MultiPart()
  @POST(Constants.applyEndpoint)
  Future<ApplyResponse> apply(@Body() FormData formData);

  @GET(Constants.getAllVehiclesEndpoint)
  Future<GetAllVehiclesResponse> getAllVehicles();

  @PUT('${Constants.updateOrderStatusEndPoint}/{id}')
  Future<String> updateOrderStatus(
      @Query('id') String id,
      @Body() Map<String,dynamic> newState,
      @Header('Authorization') String token
      );
  @GET(Constants.getAllPendingOrdersEndPoint)
  Future<OrderResponse> getAllPendingOrders(@Query("page") int page);

  @PUT((Constants.startOrderEndPoint))
  Future<OrderResponse> startOrder(@Path() String id);
}
