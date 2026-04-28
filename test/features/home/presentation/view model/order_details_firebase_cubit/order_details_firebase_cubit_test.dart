import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/base/base_state.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/domain/use_case/get_orderdetails_from_firebase.dart';
import 'package:tracking_app/features/home/presentation/view%20model/order_details_firebase_cubit/order_details_firebase_cubit.dart';

import 'order_details_firebase_cubit_test.mocks.dart';


@GenerateMocks([GetOrderdetailsFromFirebase])
void main() {
  late MockGetOrderdetailsFromFirebase mockUseCase;

  setUp(() {
    mockUseCase = MockGetOrderdetailsFromFirebase();
  });

  group('OrderDetailsFirebaseCubit', () {
    final order =OrderResponse.fromJson(   {
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
    });// Add other fields if needed

    const testOrderId = '678ab51c3ca006b9c3b0eeb4';

    blocTest<OrderDetailsFirebaseCubit, OrderDetailsFirebaseState>(
      'emits [Loading, Success] when fetchOrderDetails succeeds',
      build: () {
        when(mockUseCase.invoke(testOrderId)).thenAnswer((_) async => order);
        return OrderDetailsFirebaseCubit(mockUseCase);
      },
      act: (cubit) => cubit.fetchOrderDetails(testOrderId),
      expect: () => [
        isA<OrderDetailsFirebaseState>()
            .having((s) => s.orderState, 'loading', isA<BaseLoading<OrderResponse>>()),
        isA<OrderDetailsFirebaseState>()
            .having((s) => s.orderState, 'success', isA<BaseSuccess<OrderResponse>>())
            .having((s) => (s.orderState as BaseSuccess).data, 'order', order),
      ],
      verify: (_) {
        verify(mockUseCase.invoke(testOrderId)).called(1);
      },
    );

    blocTest<OrderDetailsFirebaseCubit, OrderDetailsFirebaseState>(
      'emits [Loading, Error] when fetchOrderDetails fails',
      build: () {
        when(mockUseCase.invoke(testOrderId))
            .thenThrow(Exception('Firebase error'));
        return OrderDetailsFirebaseCubit(mockUseCase);
      },
      act: (cubit) => cubit.fetchOrderDetails(testOrderId),
      expect: () => [
        isA<OrderDetailsFirebaseState>()
            .having((s) => s.orderState, 'loading', isA<BaseLoading<OrderResponse>>()),
        isA<OrderDetailsFirebaseState>()
            .having((s) => s.orderState, 'error', isA<BaseError<OrderResponse>>())
            .having((s) => (s.orderState as BaseError).errorMessage, 'error', contains('Firebase error')),
      ],
      verify: (_) {
        verify(mockUseCase.invoke(testOrderId)).called(1);
      },
    );
  });
}
