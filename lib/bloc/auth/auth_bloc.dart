import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthStateInitial()) {
    on<AuthEventLogin>((event, emit) async {
      // ketika event login dijalankan
      emit(AuthStateLoading());

      // Proses hit ke server backend atau cek email dan password
      bool isSuccess = _validateLogin(event.email, event.password);

      // Simulasi proses login (delayed for 3 seconds)
      await Future.delayed(const Duration(seconds: 5));

      if (isSuccess) {
        emit(AuthStateLoaded()); // Sukses login
      } else {
        // Ketika data error atau login gagal
        emit(AuthStateError(message: 'data lu salah kocak'));
      }
    });
  }

  bool _validateLogin(String email, String password) {
    if (email == 'mufarizal' && password == 'liana') {
      return true;
    } else {
      return false;
    }
  }
}