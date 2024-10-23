import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'ganjilgenap_state.dart';

class GanjilgenapCubit extends Cubit<int> {
  GanjilgenapCubit() : super(9);

  void hitunganganjilgenap(int i){
    print(state);
    print(i);
    print('+++++++++++++++++++++');
    emit((state + i)%2);
    print(state);
    print('--------------------------');
  }
}
