import 'package:flutter/material.dart';
import 'package:dealzi/Components/custom_button.dart';
import 'package:dealzi/Components/entry_field.dart';
import 'package:dealzi/Lang/locales.dart';
import 'package:dealzi/Theme/colors.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.addAddress,
          style: TextStyle(fontSize: 18, color: kMainTextColor),
        ),
        actions: [
          FlatButton(
              onPressed: () {},
              child: Text(
                locale.continueText,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 18),
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset('assets/map.png', fit: BoxFit.fitWidth),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Icon(
                      Icons.check_box,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Flexible(
                  child: EntryField(
                    horizontalPadding: 0,
                    labelFontSize: 15,
                    labelFontWeight: FontWeight.w400,
                    label: locale.addressTitle,
                    controller: TextEditingController()..text = locale.home,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, left: 12, right: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.location_on, size: 20),
                SizedBox(width: 15),
                Text(
                  'M.A Bari Road, Gollamari,\nKhulna, Bangladesh',
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          CustomButton(
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
