import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/core/functions/status_message.dart';
import 'package:shop_app/core/utils/cache_preferences_service.dart';
import 'package:shop_app/core/utils/color_manager.dart';
import 'package:shop_app/core/utils/routes_manager.dart';
import 'package:shop_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_app/features/auth/presentation/manager/auth_cubit/auth_state.dart';
import 'package:shop_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:shop_app/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:shop_app/features/auth/presentation/views/widgets/custom_textformfield.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userEmailController = TextEditingController();
    final userPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          if (state.userLoginModel.status!) {
            CacheService.saveData(
              key: 'token',
              value: state.userLoginModel.data!.token,
            ).then(
              (value) {
                // login successfuly
                statusMessage(
                  message: '${state.userLoginModel.message}',
                  backgroundColor: ColorManager.kPrimaryColor,
                );
                token = state.userLoginModel.data!.token;
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.kHomeView,
                );
              },
            );
          } else {
            // error in login
            statusMessage(
              message: '${state.userLoginModel.message}',
              backgroundColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 80.0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'LOGIN',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Login now to browse our hot offers',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  CustomTextFormField(
                    controller: userEmailController,
                    hintText: 'Email Address',
                    keyBoardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFormField(
                    obscureText: AuthCubit.get(context).loginIsObscureText,
                    controller: userPasswordController,
                    hintText: 'Password',
                    keyBoardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Colors.black54,
                    ),
                    suffixIcon: IconButton(
                      icon: AuthCubit.get(context).loginSuffixIcon,
                      onPressed: () {
                        AuthCubit.get(context).changeLoginPasswordVisibility();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (context) => CustomButton(
                      buttonLabel: 'LOGIN',
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).userLogin(
                            userEmail: userEmailController.text,
                            userPassword: userPasswordController.text,
                          );
                        }
                      },
                    ),
                    fallback: (context) => const CustomLoadinIndicator(),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                      ),
                      TextButton(
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: ColorManager.kPrimaryColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.kSignUpView,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
