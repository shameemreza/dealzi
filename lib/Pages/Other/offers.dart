import 'package:flutter/material.dart';
import 'package:dealzi/Components/drawer.dart';
import 'package:dealzi/Lang/locales.dart';
import 'package:dealzi/Theme/colors.dart';

class Offer {
  Offer(this.offerContent, this.offerCode);
  String offerContent;
  String offerCode;
}

class OffersPage extends StatefulWidget {
  @override
  _OffersPageState createState() => _OffersPageState();
}

class _OffersPageState extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Offer> offers = [
      Offer(locale.offer1, 'GET50'),
      Offer(locale.offer2, 'ABBG3'),
      Offer(locale.offer3, 'APP500'),
      Offer(locale.offer1, 'WAS50'),
      Offer(locale.offer2, 'WASR3'),
      Offer(locale.offer3, 'MSR500'),
      Offer(locale.offer1, 'NMR50'),
      Offer(locale.offer2, 'BDDD3'),
      Offer(locale.offer3, 'KHL500'),
    ];
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: AppBar(
        title: Text(
          locale.offers,
          style: TextStyle(
            color: kMainTextColor,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: offers.length,
          itemBuilder: (context, index) {
            return buildOfferCard(
                context, offers[index].offerContent, offers[index].offerCode);
          }),
    );
  }

  Card buildOfferCard(
      BuildContext context, String offerContent, String offerCode) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      color: Theme.of(context).cardColor,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        title: Text(offerContent,
            style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                letterSpacing: 0.3,
                fontSize: 16)),
        trailing: MaterialButton(
            minWidth: 90,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            color: Theme.of(context).primaryColor,
            onPressed: () {},
            child: Text(offerCode,
                style: TextStyle(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    fontSize: 15))),
      ),
    );
  }
}
