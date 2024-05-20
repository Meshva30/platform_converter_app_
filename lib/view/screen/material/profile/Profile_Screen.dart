import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../../provider/Provider_DatePicker.dart';
import '../../../../utils/adaptive/Save_Adaptive.dart';
import '../chats/chats.dart';
import 'components/Textfiled.dart';

TextEditingController? txtFullName = TextEditingController();
TextEditingController? txtPhoneNumber = TextEditingController();
TextEditingController? txtChatConversation = TextEditingController();

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

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final providerTrue = Provider.of<PersonAddProvider>(context, listen: true);
    final providerFalse =
        Provider.of<PersonAddProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 130, vertical: 10),
              child: InkWell(
                onTap: () {
                  getImage();
                },
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: image != null ? FileImage(image!) : null,
                  child: image == null
                      ? Icon(
                          Icons.camera_alt,
                          size: 50,
                          color: Colors.grey[800],
                        )
                      : null,
                ),
              ),
            ),
            TextFieldPersonAdd(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.calendar_month),
                  TextButton(
                      onPressed: () async {
                        providerFalse.setDate(await showDatePicker(
                                context: context,
                                firstDate: DateTime(1924),
                                lastDate: DateTime(2025)) ??
                            DateTime.now());
                      },
                      child: Text(
                        providerTrue.dateTime == null
                            ? "Pick Date"
                            : "${providerTrue.dateTime!.day.toString() + "-" + providerTrue.dateTime!.month.toString() + "-" + providerTrue.dateTime!.year.toString()}",
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(Icons.access_time),
                  TextButton(
                      onPressed: () async {
                        providerFalse.setTime(
                            timeOfDay: await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now()) ??
                                TimeOfDay.now());
                      },
                      child: Text(
                        providerTrue.timeOfDay == null
                            ? "Pick Time"
                            : "${providerTrue.timeOfDay!.hour.toString() + ":" + providerTrue.timeOfDay!.minute.toString()}",
                      ))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [AdaptiveSaveButton()],
            )
          ],
        ),
      ),
    );
  }
}
