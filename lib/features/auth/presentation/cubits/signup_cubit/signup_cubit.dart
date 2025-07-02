import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entites/user_entity.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());
}
