
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_converter_app/view/screen/material/profile/Profile_Screen.dart';
import 'package:platform_converter_app/view/screen/material/calls/calls.dart';
import 'package:platform_converter_app/view/screen/material/chats/chats.dart';
import 'package:platform_converter_app/view/screen/material/setting/settings.dart';


import 'package:platform_converter_app/provider/switchProvider.dart';
import 'package:provider/provider.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Palfrom Converter',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          Switch(
            value: Provider.of<SwitchProvider>(context,listen: true).isActive,
            onChanged: (value) =>
                Provider.of<SwitchProvider>(context, listen: false).isChange(value),
          ),
        ],
      ),
      body: ContainedTabBarView(tabs: [
       Icon(Icons.person),
        Text('CHATS'),
        Text('CALLS'),
        Text('SETTING'),
      ], views: [
        ProfileScreen(),
        ChatTab(),
         Call(),
        Settings(),
      ]),
    );
  }
}
