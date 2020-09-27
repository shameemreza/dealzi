import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dealzi/Auth/checkout_navigator.dart';
import 'package:dealzi/Components/custom_button.dart';
import 'package:dealzi/Lang/locales.dart';

class Address {
  Address(this.heading, this.address);
  String heading;
  String address;
//  int _radioValue;
}

class AddressPage extends StatefulWidget {
  final VoidCallback onBackButtonPressed;

  AddressPage(this.onBackButtonPressed);

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  List<int> radioButtons = [0, -1, -1];

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Address> addresses = [
      Address(locale.home, 'M.A Bari Road, Gollamari,\nKhulna, Bangladesh'),
      Address(locale.office, 'M.A Bari Road, Gollamari,\nKhulna, Bangladesh'),
      Address(locale.other, 'M.A Bari Road, Gollamari,\nKhulna, Bangladesh'),
    ];

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/header.png',
                height: 200,
                fit: BoxFit.fitHeight,
              ),
              IconButton(
                  padding: EdgeInsets.only(top: 70),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    widget.onBackButtonPressed();
                  }),
              Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 70,
                  start: MediaQuery.of(context).size.width / 3.5,
                  child: Text(
                    locale.selectAddress,
                    style: TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Theme.of(context).scaffoldBackgroundColor),
                  )),
              Positioned.directional(
                top: 130,
                width: MediaQuery.of(context).size.width,
                textDirection: Directionality.of(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
//                    mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    Text(
                      '......',
                      style: TextStyle(fontSize: 40, color: Colors.grey[400]),
                    ),
                    Icon(
                      Icons.credit_card,
                      color: Colors.red[200],
                    ),
                    Text(
                      '......',
                      style: TextStyle(fontSize: 40, color: Colors.red[200]),
                    ),
                    Image.asset(
                      'assets/ic_check.png',
                      height: 22,
                      color: Colors.red[200],
                    ),
                  ],
                ),
              )
            ],
          ),
          ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Radio(
                          value: index,
                          groupValue: radioButtons[index],
                          onChanged: (int value) {
                            setState(() {
                              for (int i = 0; i < radioButtons.length; i++) {
                                radioButtons[i] = -1;
                              }
                              radioButtons[index] = value;
                            });
                          }),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            addresses[index].heading,
                            style: Theme.of(context)
                                .textTheme
                                .button
                                .copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            addresses[index].address,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
          Spacer(),
          CustomButton(
            onTap: () =>
                Navigator.pushNamed(context, CheckOutRoutes.paymentMode),
          ),
        ],
      ),
    );
  }
}
