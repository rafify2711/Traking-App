import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/auth/apply/data/models/apply_model/apply_response/driver.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';

import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';
import 'package:tracking_app/features/home/data/repo/home_repo_impl.dart';
import 'package:tracking_app/features/home/domain/repo/home_repo.dart';
import 'package:tracking_app/features/orders/data/model/orders_firebase_model.dart';

import 'home_screen_repo_imp_test.mocks.dart';

@GenerateMocks([HomeDataSource])
void main() {
  late MockHomeScreenDataSource mockDataSource;
  late HomeRepo repo;

  setUp(() {
    mockDataSource = MockHomeScreenDataSource();
    repo = HomeRepoImpl(mockDataSource);
  });

  group('HomeScreenRepoImp Tests', () {
    const page = 1;

    test(
      'should return ApiSuccess<OrderResponse> when getAllPendingOrders succeeds',
          () async {
        // arrange
        final response = PendingOrderResponse(); // You can provide mock data here
        final expected = ApiSuccess<PendingOrderResponse>(data: response);
        provideDummy<ApiResult<PendingOrderResponse>>(expected);

        when(
          mockDataSource.getAllPendingOrders(page),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getAllPendingOrders(page);

        // assert
        verify(mockDataSource.getAllPendingOrders(page)).called(1);
        expect(actual, expected);
      },
    );

    test(
      'should return ApiError<OrderResponse> when getAllPendingOrders fails',
          () async {
        // arrange
        final expected = ApiError<PendingOrderResponse>(
          message: 'Network error',
          failure: ServerFailure(errorMessage: 'Network error'),
        );
        provideDummy<ApiResult<PendingOrderResponse>>(expected);

        when(
          mockDataSource.getAllPendingOrders(page),
        ).thenAnswer((_) async => expected);

        // act
        final actual = await repo.getAllPendingOrders(page);

        // assert
        verify(mockDataSource.getAllPendingOrders(page)).called(1);
        expect(actual, expected);
      },
    );
    test(
      'should return OrderDetails when getOrderDetailsFromFireBase succeeds',
          () async {
        // arrange
        final response = OrderResponse(); // You can provide mock data here
        final expectedOrderResponse =OrderResponse.fromJson(   {
          "_id": "678ab51c3ca006b9c3b0eeb4",
          "driver": "678a59fa3c3797492747c8d4",
          "order": {
            "_id": "678a9bb63745562ff48ce07b",
            "user": {
              "_id": "678a783d3c3797492747c8e6",
              "firstName": "Elevate",
              "lastName": "Tech",
              "email": "ahmedmutti222@gmail.com",
              "gender": "male",
              "phone": "+201010700999",
              "photo": "default-profile.png"
            },
            "orderItems": [
              {
                "product": null,
                "price": 250,
                "quantity": 2,
                "_id": "678a9bb43c3797492747c9b7"
              }
            ],
            "totalPrice": 250,
            "paymentType": "cash",
            "isPaid": false,
            "isDelivered": false,
            "state": "pending",
            "createdAt": "2025-01-17T18:04:38.730Z",
            "updatedAt": "2025-05-15T13:40:34.151Z",
            "orderNumber": "#123451",
            "__v": 0
          },
          "__v": 0,
          "createdAt": "2025-01-17T19:53:00.933Z",
          "updatedAt": "2025-01-17T19:53:00.933Z",
          "store": {
            "name": "Elevate FlowerApp Store",
            "image": "https://www.elevateegy.com/elevate.png",
            "address": "123 Fixed Address, City, Country",
            "phoneNumber": "1234567890",
            "latLong": "37.7749,-122.4194"
          }
        });
        final fakeOrdersFirebaseModel = OrdersFirebaseModel(order: expectedOrderResponse,driver: const Driver());

        provideDummy<OrderResponse>(expectedOrderResponse );

        const orderId = '681bd6741433a666c8da31c7';
        when(mockDataSource.getOrderDetailsFireBase(orderId))
            .thenAnswer((_) async => fakeOrdersFirebaseModel);

        // act
        final actual = await repo.getOrderDetailsFromFireBase(orderId);

        // assert
        verify(mockDataSource.getOrderDetailsFireBase(orderId)).called(1);
        expect(actual, expectedOrderResponse);
      },
    );
    test(
      'should throw an exception when getOrderDetailsFromFireBase fails',
          () async {
        // arrange
        const orderId = '681bd6741433a666c8da31c7';
        when(mockDataSource.getOrderDetailsFireBase(orderId))
            .thenThrow(Exception('Firebase error'));

        // act & assert
        expect(
          () async => await repo.getOrderDetailsFromFireBase(orderId),
          throwsException,
        );

        verify(mockDataSource.getOrderDetailsFireBase(orderId)).called(1);
      },
    );

  });
}