import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/api_service.dart';
import 'package:shop_app/features/auth/data/models/user_model/user_model.dart';
import 'package:shop_app/features/auth/presentation/manager/auth_cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
    this._apiService,
  ) : super(AuthInitialState());

  static AuthCubit get(context) => BlocProvider.of(context);
  final ApiService _apiService;

  void userLogin({
    required String userEmail,
    required String userPassword,
  }) async {
    emit(LoginLoadingState());
    try {
      Response response = await _apiService.postUserData(
        endPoint: 'login',
        data: {
          'email': userEmail,
          'password': userPassword,
        },
        // language: 'eg',
      );
      UserModel userLoginModel = UserModel.fromJson(response.data);
      emit(LoginSuccessState(userLoginModel));
    } on DioException catch (e) {
      emit(
        LoginFailureState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void userSignUp({
    required String userName,
    required String userNumber,
    required String userEmail,
    required String userPassword,
  }) async {
    emit(SignUpLoadingState());
    try {
      Response response = await _apiService.postUserData(
        endPoint: 'register',
        data: {
          'name': userName,
          'phone': userNumber,
          'email': userEmail,
          'password': userPassword,
        },
        // language: 'eg',
      );
      UserModel userLoginModel = UserModel.fromJson(response.data);
      emit(SignUpSuccessState(userLoginModel));
    } on DioException catch (e) {
      emit(
        SignUpFailureState(
          errMessage: e.toString(),
        ),
      );
    }
  }

  Icon loginSuffixIcon = const Icon(
    Icons.visibility_outlined,
    color: Colors.black54,
  );
  bool loginIsObscureText = true;

// change password icon
  void changeLoginPasswordVisibility() {
    loginIsObscureText = !loginIsObscureText;
    loginSuffixIcon = loginIsObscureText
        ? const Icon(
            Icons.visibility_outlined,
            color: Colors.black54,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: Colors.black54,
          );
    emit(
      ChangeLoginEyeIconViesibiltyState(),
    );
  }

  Icon signUpSuffixIcon = const Icon(
    Icons.visibility_outlined,
    color: Colors.black54,
  );
  bool signUpIsObscureText = true;

// change password icon
  void changeSignUpPasswordVisibility() {
    signUpIsObscureText = !signUpIsObscureText;
    signUpSuffixIcon = signUpIsObscureText
        ? const Icon(
            Icons.visibility_outlined,
            color: Colors.black54,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: Colors.black54,
          );
    emit(
      ChangeSignUpEyeIconViesibiltyState(),
    );
  }
}
