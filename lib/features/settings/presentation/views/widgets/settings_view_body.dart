import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/core/widgets/custom_circular_indicator.dart';
import 'package:shop_app/features/settings/presentation/manager/settings_cubit/settings_cubit.dart';
import 'package:shop_app/features/settings/presentation/manager/settings_cubit/settings_state.dart';
import 'package:shop_app/features/settings/presentation/views/widgets/settings_view_success_body.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoadingState ||
            state is SettingsUpadateProfileLoadingState) {
          return const CustomCircularIndicator();
        } else if (state is SettingsSuccessState) {
          return SettingsViewSuccessBody(
            profileModel: state.profileModel,
          );
        } else if (state is SettingsFailureState) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(fontSize: 40.0),
            ),
          );
        }
        return const Center(
          child: Text(
            'Oops there was an error!',
            style: TextStyle(fontSize: 40.0),
          ),
        );
      },
    );
  }
}
