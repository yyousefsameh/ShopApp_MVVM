import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/utils/api_service.dart';
import 'package:shop_app/features/auth/data/models/user_model/user_model.dart';

import 'package:shop_app/features/settings/presentation/manager/settings_cubit/settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitialState());

  final ApiService apiService = ApiService();
  void getUserProfileData() async {
    UserModel profileModel;
    emit(SettingsLoadingState());
    try {
      Response response = await apiService.getData(
        endPoint: 'profile',
        token: token,
      );
      profileModel = UserModel.fromJson(response.data);
      print(profileModel.data!.name);
      emit(SettingsSuccessState(profileModel: profileModel));
    } on DioException catch (e) {
      emit(SettingsFailureState(errorMessage: e.toString()));
    }
  }

  void updateUserProfileData({
    required String userName,
    required String userEmail,
    required String userPhone,
  }) async {
    UserModel profileModel;
    emit(SettingsUpadateProfileLoadingState());
    try {
      Response response = await apiService.postUserData(
        endPoint: 'update-profile',
        token: token,
        data: {
          'name': userName,
          'email': userEmail,
          'phone': userPhone,
        },
      );
      profileModel = UserModel.fromJson(response.data);
      emit(SettingUpdateProfileSuccessState(profileModel: profileModel));
    } on DioException catch (e) {
      emit(SettingsUpadteProfileFailureState(errorMessage: e.toString()));
    }
  }
}
