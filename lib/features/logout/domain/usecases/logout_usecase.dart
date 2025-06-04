import 'package:injectable/injectable.dart';

import '../repositories/logout_repository.dart';
@injectable
class LogoutUseCase {
  final LogoutRepository repository;

  LogoutUseCase(this.repository);
 invoke() async {
   return await repository.logout();
 }
  // TODO: Implement call logic
}
