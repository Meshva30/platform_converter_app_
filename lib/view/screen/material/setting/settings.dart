import 'package:flutter/material.dart';
import 'package:platform_converter_app/provider/profile_switchProvider.dart';
import 'package:provider/provider.dart';

import '../../../../provider/theme_provider.dart';
import '../../Ios/profile/profile.dart';
import 'components/profilecontainer.dart';


class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            subtitle: Text('Update Profile Data'),
            trailing: Switch(
              value:
              Provider
                  .of<ProfileProvider>(context, listen: true)
                  .isActive,
              onChanged: (value) =>
                  Provider.of<ProfileProvider>(context, listen: false)
                      .isChangeSwitch(value),
            ),
          ),
          Consumer<ProfileProvider>(
            builder: (context, profileProvider, child) {
              return profileProvider.isActive
                  ? Container(
                  margin: EdgeInsets.all(16),
                  padding: EdgeInsets.all(16),
                  child: profile_container())
                  : Container();
            },
          ),
          ListTile(
            leading: Icon(Icons.light_mode_outlined),
            title: Text('Theme'),
            subtitle: Text('Change Theme'),
            trailing: Switch(
              inactiveThumbColor: Colors.white,
              value:
              Provider
                  .of<ThemeProvider>(context, listen: true)
                  .isDarkMode,
              onChanged: (value) {
                Provider.of<ThemeProvider>(context, listen: false).theme(value);
              },
            ),
          ),
        ],
      ),
    );
  }
}