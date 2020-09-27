import 'package:flutter/material.dart';
import 'package:dealzi/Auth/login_navigator.dart';
import 'package:dealzi/Components/custom_button.dart';
import 'package:dealzi/Components/entry_field.dart';
import 'package:dealzi/Lang/locales.dart';
import 'package:dealzi/Theme/colors.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          locale.register,
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Spacer(
            flex: 1,
          ),
          EntryField(
            label: locale.fullName,
            hint: locale.enterFullName,
          ),
          EntryField(
            label: locale.emailAddress,
            hint: locale.enterEmailAddress,
          ),
          EntryField(
            label: locale.selectCountry,
            hint: locale.selectCountry,
            suffixIcon: Icons.arrow_drop_down,
          ),
          EntryField(
            label: locale.phoneNumber,
            hint: locale.enterPhoneNumber,
          ),
          Spacer(
            flex: 5,
          ),
          CustomButton(
            onTap: () =>
                Navigator.pushNamed(context, SignInRoutes.verification),
          )
        ],
      ),
    );
  }
}
