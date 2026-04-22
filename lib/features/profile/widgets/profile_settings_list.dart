import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurina/features/profile/cubit/contact_us_cubit.dart';
import 'package:neurina/features/profile/cubit/profile_cubit.dart';
import 'package:neurina/features/profile/cubit/profile_state.dart';
import 'package:neurina/features/profile/data/profile_repo.dart';
import 'package:neurina/features/profile/screens/contact_us_screen.dart';
import 'package:neurina/features/profile/widgets/build_settings_item.dart';

class ProfileSettingsList extends StatefulWidget {
  const ProfileSettingsList({super.key});

  @override
  State<ProfileSettingsList> createState() => _ProfileSettingsListState();
}

class _ProfileSettingsListState extends State<ProfileSettingsList> {
  @override
  Widget build(BuildContext context) {
    void changeLanguage() {
      setState(() {
        if (context.locale == const Locale('en')) {
          context.setLocale(const Locale('ar'));
        } else {
          context.setLocale(const Locale('en'));
        }
      });
    }

    return Column(
      children: [
        BuildSettingsItem(
          icon: Icons.language,
          title: 'language'.tr(),
          onTap: changeLanguage,
        ),
        BuildSettingsItem(
          icon: Icons.help_outline,
          title: 'contact_us'.tr(),
          onTap: () {
            final state = context.read<ProfileCubit>().state;
            if (state is ProfileSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => ContactUsCubit(profileRepo: ProfileRepo()),
                    child: ContactUsScreen(user: state.user),
                  ),
                ),
              );
            }
          },
        ),
        BuildSettingsItem(
          icon: Icons.info_outline,
          title: 'about_app'.tr(),
          onTap: () {},
        ),
        BuildSettingsItem(
          icon: Icons.description_outlined,
          title: 'terms_conditions'.tr(),
          onTap: () {},
        ),
      ],
    );
  }
}
