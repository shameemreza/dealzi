import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:dealzi/Lang/locales.dart';
import 'package:dealzi/Pages/About/about_us.dart';
import 'package:dealzi/Pages/About/contact_us.dart';
import 'package:dealzi/Pages/DrawerPages/my_orders_drawer.dart';
import 'package:dealzi/Pages/Other/home_page.dart';
import 'package:dealzi/Pages/Other/language_choose.dart';
import 'package:dealzi/Pages/Other/offers.dart';
import 'package:dealzi/Pages/User/my_account.dart';
import 'package:dealzi/Pages/User/wishlist.dart';

Drawer buildDrawer(BuildContext context) {
  var locale = AppLocalizations.of(context);
  return Drawer(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menubg.png'), fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 44.0),
            child: Text(
              locale.hey + ',\nShameem\nReza',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 22, letterSpacing: 0.5),
            ),
          ),
          buildListTile(context, Icons.home, locale.home, HomePage()),
          buildListTile(
              context, Icons.account_box, locale.myProfile, MyAccount()),
          buildListTile(
              context, Icons.shopping_cart, locale.myOrders, MyOrdersDrawer()),
          buildListTile(
              context, Icons.local_offer, locale.offers, OffersPage()),
          buildListTile(
              context, Icons.favorite, locale.myWishList, MyWishList()),
          buildListTile(
              context, Icons.view_list, locale.aboutUs, AboutUsPage()),
          buildListTile(
              context, Icons.chat, locale.helpCentre, ContactUsPage()),
          buildListTile(
              context, Icons.language, locale.language, ChooseLanguage()),
          ListTile(
            onTap: () {
              Phoenix.rebirth(context);
            },
            leading: Icon(
              Icons.subdirectory_arrow_right,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              locale.logout,
              style: TextStyle(letterSpacing: 2),
            ),
          ),
          Spacer(flex: 2),
        ],
      ),
    ),
  );
}

ListTile buildListTile(
    BuildContext context, IconData icon, String title, Widget onPress) {
  return ListTile(
    onTap: () {
      Navigator.pop(context);
//      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context) => onPress));
    },
    leading: Icon(
      icon,
      color: Theme.of(context).primaryColor,
    ),
    title: Text(
      title,
      style: TextStyle(letterSpacing: 2),
    ),
  );
}
