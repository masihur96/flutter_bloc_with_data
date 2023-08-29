import 'package:flutter_bloc/flutter_bloc.dart';

class UIChangeCubit extends Cubit<bool> {
  UIChangeCubit() : super(false);
  void toggleUI() {
    emit(!state);
  }
}
