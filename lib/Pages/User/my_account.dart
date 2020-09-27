import 'package:flutter/material.dart';
import 'package:dealzi/Components/custom_button.dart';
import 'package:dealzi/Components/drawer.dart';
import 'package:dealzi/Components/entry_field.dart';
import 'package:dealzi/Lang/locales.dart';
import 'package:dealzi/Pages/Other/add_address.dart';
import 'package:dealzi/Theme/colors.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(
          locale.myAccount,
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  locale.myProfile,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 16, letterSpacing: 1, color: Color(0xffa9a9a9)),
                ),
                SizedBox(
                  height: 20,
                ),
                EntryField(
                  controller: TextEditingController()..text = 'Shameem Reza',
                  labelFontWeight: FontWeight.w400,
                  horizontalPadding: 0,
                  label: locale.fullName,
                  labelFontSize: 16,
                ),
                EntryField(
                  controller: TextEditingController()..text = 'info@shameem.me',
                  labelFontWeight: FontWeight.w400,
                  horizontalPadding: 0,
                  label: locale.emailAddress,
                  labelFontSize: 16,
                ),
                EntryField(
                  controller: TextEditingController()
                    ..text = '+88 01714 545458',
                  labelFontWeight: FontWeight.w400,
                  horizontalPadding: 0,
                  label: locale.phoneNumber,
                  labelFontSize: 16,
                ),
              ],
            ),
          ),
          Divider(
            color: Colors.grey[100],
            thickness: 10,
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  locale.myAddresses,
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      fontSize: 16, letterSpacing: 1, color: Color(0xffa9a9a9)),
                ),
                SizedBox(
                  height: 20,
                ),
                buildAddressTile(locale.home,
                    'M.A Bari Road, Gollamari,\nKhulna, Bangladesh'),
                SizedBox(
                  height: 20,
                ),
                buildAddressTile(locale.office,
                    'M.A Bari Road, Gollamari,\nKhulna, Bangladesh'),
              ],
            ),
          ),
          Spacer(),
          CustomButton(
            label: locale.addAddress.toUpperCase(),
            onPress: AddAddressPage(),
          ),
        ],
      ),
    );
  }

  ListTile buildAddressTile(String heading, String address) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 4),
      title: Row(
        children: [
          Text(heading),
          Spacer(),
          Icon(
            Icons.edit,
            color: Color(0xff686868),
            size: 20,
          ),
        ],
      ),
      subtitle: Text(
        address,
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
