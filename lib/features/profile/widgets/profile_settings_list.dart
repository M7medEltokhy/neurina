import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
          onTap: () {},
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
