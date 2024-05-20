import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../modal/Global_model.dart';
import '../../../../provider/Provider_DatePicker.dart';
import '../../../../provider/chatProvider.dart';
import '../../../../utils/adaptive/Save_Adaptive.dart';
import 'components/textfiled.dart';

final picker = ImagePicker();
File? image;

Future getImage() async {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    image = File(pickedFile.path);
  } else {
    print('No image selected.');
  }
}

class IosProfile extends StatelessWidget {
  const IosProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<PersonAddProvider>(context, listen: true);
    final providerFalse =
        Provider.of<PersonAddProvider>(context, listen: false);
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 90),
            child: GestureDetector(
              onTap: () {
                getImage();
              },
              child: CircleAvatar(
                radius: 90,
                backgroundImage: image != null ? FileImage(image!) : null,
                child: image == null
                    ? Icon(CupertinoIcons.camera,
                        size: 50, color: CupertinoColors.systemGrey)
                    : null,
              ),
            ),
          ),
          cupertinoTextfiled(
            text: 'Full Name',
            icon: CupertinoIcons.person,
            type: TextInputType.name,
            controller: txtfullname,
          ),
          cupertinoTextfiled(
            text: 'Phone Number',
            icon: CupertinoIcons.phone,
            type: TextInputType.number,
            controller: txtmobilenumber,
          ),
          cupertinoTextfiled(
            text: 'Chat Conversation',
            icon: CupertinoIcons.chat_bubble_text,
            type: TextInputType.name,
            controller: txtchat,
          ),


          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.calendar),
                    CupertinoButton(
                      child: Text(
                        providerTrue.dateTime == null
                            ? "Pick Date"
                            : "${providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString()}",
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 200,
                            color: CupertinoColors.white,
                            child: CupertinoDatePicker(
                              onDateTimeChanged: (value) {
                                providerFalse.setDate(value);
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(CupertinoIcons.time),
                    CupertinoButton(
                      child: Text(
                        providerTrue.timeOfDay == null
                            ? "Pick Time"
                            : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                      ),
                      onPressed: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 200,
                            color: CupertinoColors.white,
                            child: CupertinoTimerPicker(
                              onTimerDurationChanged: (value) {
                                providerFalse.setTime(duration: value);
                              },
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [AdaptiveSaveButton()],
              )
            ],
          ),
        ],
      ),
    );
  }
}
