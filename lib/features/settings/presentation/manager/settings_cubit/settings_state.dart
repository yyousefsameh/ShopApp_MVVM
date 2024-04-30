import 'package:shop_app/features/auth/data/models/user_model/user_model.dart';

abstract class SettingsState {}

final class SettingsInitialState extends SettingsState {}

final class SettingsLoadingState extends SettingsState {}

final class SettingsSuccessState extends SettingsState {
  final UserModel profileModel;

  SettingsSuccessState({required this.profileModel});
}

final class SettingsFailureState extends SettingsState {
  final String errorMessage;

  SettingsFailureState({required this.errorMessage});
}

final class SettingsUpadateProfileLoadingState extends SettingsState {}

final class SettingUpdateProfileSuccessState extends SettingsState {
  final UserModel profileModel;

  SettingUpdateProfileSuccessState({required this.profileModel});
}

final class SettingsUpadteProfileFailureState extends SettingsState {
  final String errorMessage;

  SettingsUpadteProfileFailureState({required this.errorMessage});
}
