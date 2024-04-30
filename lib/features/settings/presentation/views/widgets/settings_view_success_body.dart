import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/utils/cache_preferences_service.dart';
import 'package:shop_app/core/utils/routes_manager.dart';
import 'package:shop_app/features/auth/data/models/user_model/user_model.dart';
import 'package:shop_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:shop_app/features/auth/presentation/views/widgets/custom_textformfield.dart';
import 'package:shop_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';

class SettingsViewSuccessBody extends StatelessWidget {
  const SettingsViewSuccessBody({super.key, required this.profileModel});

  final UserModel profileModel;
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController userEmailController = TextEditingController();
    TextEditingController userPhoneController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    userNameController.text = profileModel.data!.name!;
    userEmailController.text = profileModel.data!.email!;
    userPhoneController.text = profileModel.data!.phone!;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextFormField(
                controller: userNameController,
                keyBoardType: TextInputType.name,
                hintText: 'Name',
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20.0),
              CustomTextFormField(
                controller: userEmailController,
                keyBoardType: TextInputType.emailAddress,
                hintText: 'Email Address',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20.0),
              CustomTextFormField(
                controller: userPhoneController,
                keyBoardType: TextInputType.phone,
                hintText: 'Phone',
                prefixIcon: const Icon(
                  Icons.phone_outlined,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                buttonLabel: 'Save',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<SettingsCubit>(context)
                        .updateUserProfileData(
                      userName: userNameController.text,
                      userEmail: userEmailController.text,
                      userPhone: userPhoneController.text,
                    );
                  }
                },
              ),
              const SizedBox(height: 20.0),
              CustomButton(
                buttonLabel: 'Log Out',
                onTap: () {
                  CacheService.removeData(key: 'token');
                  Navigator.pushReplacementNamed(context, AppRoutes.kLoginView);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
