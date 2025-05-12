// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:tracking_app/core/utils/Errors/error_handler.dart';

// class FirestoreFailure extends Failure {
//   FirestoreFailure({required super.errorMessage});

//   factory FirestoreFailure.fromFirestoreException(FirebaseException e) {
//     switch (e.code) {
//       case 'permission-denied':
//         return FirestoreFailure(errorMessage: 'You do not have permission to access this data.');
//       case 'unavailable':
//         return FirestoreFailure(errorMessage: 'Firestore service is currently unavailable. Try again later.');
//       case 'not-found':
//         return FirestoreFailure(errorMessage: 'Requested document not found.');
//       case 'already-exists':
//         return FirestoreFailure(errorMessage: 'Document already exists.');
//       case 'cancelled':
//         return FirestoreFailure(errorMessage: 'The operation was cancelled.');
//       case 'aborted':
//         return FirestoreFailure(errorMessage: 'The operation was aborted due to a conflict.');
//       default:
//         return FirestoreFailure(errorMessage: 'An unknown Firestore error occurred: ${e.message}');
//     }
//   }
// }
