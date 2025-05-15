import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tracking_app/core/api_manger/api_service.dart';
import 'package:tracking_app/core/base/api_result.dart';
import 'package:tracking_app/core/utils/Errors/error_handler.dart';
import 'package:tracking_app/features/home/data/data%20source/home_screen_data_source_imp.dart';
import 'package:tracking_app/features/home/data/models/order_details.dart';
import 'package:tracking_app/features/home/data/models/pending_orders_response.dart';

import 'home_screen_data_source_imp_test.mocks.dart';

@GenerateMocks([ApiService, FirebaseFirestore,   CollectionReference<Map<String, dynamic>>,
  DocumentReference<Map<String, dynamic>>,
  DocumentSnapshot<Map<String, dynamic>>,])
void main() {
  late ApiService apiService;
  late FirebaseFirestore firestore;
  late HomeScreenDataSourceImp dataSource;

  setUp(() {
    apiService = MockApiService();
    firestore = MockFirebaseFirestore();
    dataSource = HomeScreenDataSourceImp(apiService, firestore);

  });

  group('HomeScreenDataSourceImp', () {
    const page = 1;

    test(
      'should return ApiSuccess<OrderResponse> when getAllPendingOrders succeeds',
          () async {
        // Arrange
        final expectedResponse = OrderResponse();
        when(
          apiService.getAllPendingOrders(page),
        ).thenAnswer((_) async => expectedResponse);

        // Act
        final result = await dataSource.getAllPendingOrders(page);

        // Assert
        verify(apiService.getAllPendingOrders(page)).called(1);
        expect(result, isA<ApiSuccess<OrderResponse>>());
      },
    );

    test(
      'should return ApiError<OrderResponse> when getAllPendingOrders fails',
          () async {
        // Arrange
        when(
          apiService.getAllPendingOrders(page),
        ).thenThrow(ServerFailure(errorMessage: 'error'));

        // Act
        final result = await dataSource.getAllPendingOrders(page);

        // Assert
        verify(apiService.getAllPendingOrders(page)).called(1);
        expect(result, isA<ApiError<OrderResponse>>());
      },
    );
  });
  group('FetchOrderDetailsFromFireBase', () {
    test(
      'should return OrderDetails when getOrderDetails from firebase succeeds',
          () async {
            final mockCollection = MockCollectionReference<Map<String, dynamic>>();
            final mockDocRef = MockDocumentReference<Map<String, dynamic>>();
            final mockDocSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();

            final expectedMap =        {
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
            };

            when(firestore.collection('orders')).thenReturn(mockCollection);
            when(mockCollection.doc("681bd6741433a666c8da31c7")).thenReturn(mockDocRef);
            when(mockDocRef.get()).thenAnswer((_) async => mockDocSnapshot);
            when(mockDocSnapshot.exists).thenReturn(true);
            when(mockDocSnapshot.data()).thenReturn({'order': expectedMap});

            // Act
            final result = await dataSource.getOrderDetailsFireBase();

            // Assert
            expect(result, isA<OrderDetails>());
        //     // Arrange
        //     final doc = await firestore.collection('orders')  .doc("681bd6741433a666c8da31c7").get();
        //
        //     final data = doc.data()?['order'];
        //
        //     final expectedResponse =  OrderDetails();
        //     final result = await dataSource.getOrderDetailsFireBase();
        //
        //
        //     when(
        //    data
        //         ).thenAnswer((_) async => expectedResponse);
        //
        // // Act
        //
        // // Assert
        // verify(data).called(1);
        // expect(result, isA<OrderDetails>());
      },
    );

    test(
      'should throw exception when order does not exist in firestore',
          () async {
            final mockCollection = MockCollectionReference<Map<String, dynamic>>();
            final mockDocRef = MockDocumentReference<Map<String, dynamic>>();
            final mockDocSnapshot = MockDocumentSnapshot<Map<String, dynamic>>();


        when(firestore.collection('orders')).thenReturn(mockCollection);
        when(mockCollection.doc("681bd6741433a666c8da31c7")).thenReturn(mockDocRef);
        when(mockDocRef.get()).thenAnswer((_) async => mockDocSnapshot);
        when(mockDocSnapshot.exists).thenReturn(false);

        // Act & Assert
        expect(
              () async => await dataSource.getOrderDetailsFireBase(),
          throwsException,
        );
      },
    );

  });
}
