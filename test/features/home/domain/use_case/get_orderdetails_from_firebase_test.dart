import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/features/home/data/models/order_response.dart';
import 'package:tracking_app/features/home/domain/repo/home_repo.dart';
import 'package:tracking_app/features/home/domain/use_case/get_orderdetails_from_firebase.dart';

import 'get_all_pending_orders_use_case_test.mocks.dart';


@GenerateMocks([HomeRepo])
void main() {
  late MockHomeScreenRepo mockRepo;
  late GetOrderdetailsFromFirebase useCase;

  setUp(() {
    mockRepo = MockHomeScreenRepo();
    useCase = GetOrderdetailsFromFirebase(mockRepo);
  });

  group('GetOrderdetailsFromFirebase UseCase', () {
    test(
      'should return OrderDetails when repo returns successfully',
          () async {
        // arrange
        final expected =OrderResponse.fromJson(   {
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

        const orderId = '678ab51c3ca006b9c3b0eeb4';
        when(mockRepo.getOrderDetailsFromFireBase(orderId))
            .thenAnswer((_) async => expected);

        // act
        final result = await useCase.invoke(orderId);

        // assert
        verify(mockRepo.getOrderDetailsFromFireBase(orderId)).called(1);
        expect(result, expected);
      },
    );

    test(
      'should throw exception when repo throws',
          () async {
        // arrange
        const orderId = '678ab51c3ca006b9c3b0eeb4';
        when(mockRepo.getOrderDetailsFromFireBase(orderId))
            .thenThrow(Exception('Firebase error'));

        // act & assert
        expect(
          () async => await useCase.invoke(orderId),
          throwsException,
        );
        verify(mockRepo.getOrderDetailsFromFireBase(orderId)).called(1);
      },
    );
  });
}
