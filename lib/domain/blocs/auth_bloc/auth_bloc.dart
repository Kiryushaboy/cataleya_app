import 'package:bloc/bloc.dart';
import 'package:coffee/domain/api/api_service.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc extends Cubit<bool> {
  final ApiService _apiService = ApiService();

  AuthenticationBloc() : super(false);

  Future<void> login(String username, String password) async {
    try {
      final response = await _apiService.login(username, password);
      if (response.statusCode == 200) {
        emit(true);
      } else {
        emit(false);
      }
    } catch (_) {
      emit(false);
    }
  }
}
