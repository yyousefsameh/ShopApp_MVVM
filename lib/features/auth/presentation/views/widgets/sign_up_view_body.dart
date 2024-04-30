import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/functions/status_message.dart';
import 'package:shop_app/core/utils/color_manager.dart';
import 'package:shop_app/core/utils/routes_manager.dart';
import 'package:shop_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:shop_app/features/auth/presentation/manager/auth_cubit/auth_state.dart';

import 'package:shop_app/features/auth/presentation/views/widgets/custom_button.dart';
import 'package:shop_app/features/auth/presentation/views/widgets/custom_loading_indicator.dart';
import 'package:shop_app/features/auth/presentation/views/widgets/custom_textformfield.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final userNameController = TextEditingController();
    final userNumberController = TextEditingController();
    final userEmailController = TextEditingController();
    final userPasswordController = TextEditingController();

    final formKey = GlobalKey<FormState>();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is SignUpSuccessState) {
          if (state.userLoginModel.status!) {
            statusMessage(
              message: '${state.userLoginModel.message}',
              backgroundColor: ColorManager.kPrimaryColor,
            );
            Navigator.pushReplacementNamed(context, AppRoutes.kLoginView);
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Create your account',
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
                    controller: userNameController,
                    hintText: 'Name',
                    keyBoardType: TextInputType.name,
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomTextFormField(
                    controller: userNumberController,
                    hintText: 'Phone Number',
                    keyBoardType: TextInputType.phone,
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
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
                    obscureText:
                        BlocProvider.of<AuthCubit>(context).signUpIsObscureText,
                    controller: userPasswordController,
                    hintText: 'Password',
                    keyBoardType: TextInputType.visiblePassword,
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Colors.black54,
                    ),
                    suffixIcon: IconButton(
                      icon:
                          BlocProvider.of<AuthCubit>(context).signUpSuffixIcon,
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context)
                            .changeSignUpPasswordVisibility();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (context) => CustomButton(
                      buttonLabel: 'Sign Up',
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<AuthCubit>(context).userSignUp(
                            userName: userNameController.text,
                            userNumber: userNumberController.text,
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
                        'Alread have an account?',
                      ),
                      TextButton(
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            color: ColorManager.kPrimaryColor,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.kLoginView,
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
