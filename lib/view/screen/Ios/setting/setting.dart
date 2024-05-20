import 'package:flutter/cupertino.dart';
import 'package:platform_converter_app/view/screen/Ios/setting/components/profilecontainer.dart';
import 'package:platform_converter_app/view/screen/material/setting/components/profilecontainer.dart';
import 'package:provider/provider.dart';

import '../../../../provider/profile_switchProvider.dart';
import '../../../../provider/theme_provider.dart';

class IosSetting extends StatelessWidget {
  const IosSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100),
        child: Column(
          children: [
            CupertinoListTile(
              leading: Icon(CupertinoIcons.person),
              title: Text('Profile'),
              subtitle: Text('Update Profile Data'),
              trailing: CupertinoSwitch(
                value: Provider
                    .of<ProfileProvider>(context, listen: true)
                    .isActive,
                onChanged: (bool value) {
                  Provider.of<ProfileProvider>(context, listen: false)
                      .isChangeSwitch(value);
                },
              ),
            ),
            Consumer<ProfileProvider>(
              builder: (context, profileProvider, child) {
                return profileProvider.isActive
                    ? Container(
                    margin: EdgeInsets.all(16),
                    padding: EdgeInsets.all(16),
                    child: profile__container())
                    : Container();
              },
            ),
            SizedBox(height: 10,),
            CupertinoListTile(
              leading: Icon(CupertinoIcons.light_max),
              title: Text('Theme'),
              subtitle: Text('Change Theme'),
              trailing: CupertinoSwitch(
                value: Provider
                    .of<ThemeProvider>(context, listen: true)
                    .isDarkMode,
                onChanged: (bool value) {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .theme(value);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
