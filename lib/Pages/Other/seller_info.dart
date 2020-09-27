import 'package:flutter/material.dart';
import 'package:dealzi/Auth/checkout_navigator.dart';
import 'package:dealzi/Lang/locales.dart';
import 'package:dealzi/Pages/Search/cart.dart';
import 'package:dealzi/Pages/Search/search_result.dart';

class Product {
  Product(this.image, this.productName, this.productType, this.price);
  String image;
  String productName;
  String productType;
  String price;
}

class SellerInfo extends StatefulWidget {
  @override
  _SellerInfoState createState() => _SellerInfoState();
}

class _SellerInfoState extends State<SellerInfo> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Product> products = [
      Product("assets/ProductImages/onion.png", locale.freshRedOnios,
          "Dipantor", "\$30.0"),
      Product("assets/ProductImages/tomato.png", locale.freshRedTomatoes,
          "Salvin Shop", "\$44.0"),
      Product("assets/ProductImages/Potatoes.png", locale.mediumPotatoes,
          "Angshuk", "\$29.0"),
      Product("assets/ProductImages/lady finger.png", locale.freshLadiesFinger,
          "Rousi Ghor", "\$32.0"),
      Product("assets/ProductImages/Garlic.png", locale.freshGarlic, "Pajeroma",
          "\$30.0"),
      Product("assets/ProductImages/Cauliflower.png", locale.cauliFlower,
          "Aarish Mart", "\$35.0"),
      Product("assets/ProductImages/lady finger.png", locale.freshLadiesFinger,
          "Dipantor", "\$32.0"),
      Product("assets/ProductImages/Garlic.png", locale.freshGarlic, "Pajeroma",
          "\$30.0"),
      Product("assets/ProductImages/Cauliflower.png", locale.cauliFlower,
          "Angshuk", "\$35.0"),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.75), BlendMode.dstATop),
                      image: AssetImage('assets/seller1.png'),
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 50,
                  start: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
                ),
                Positioned.directional(
                  textDirection: Directionality.of(context),
                  top: 40,
                  end: 10,
                  child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckOutNavigator()));
                      },
                      icon: ImageIcon(AssetImage('assets/ic_cart.png'),
                          color: Colors.white)),
                ),
                Positioned.directional(
                  bottom: 20,
                  start: 20,
                  textDirection: TextDirection.ltr,
                  child: Text('Angshukt',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 24,
                          letterSpacing: 0.5,
                          fontWeight: FontWeight.w500)),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildGridView(products),
            ),
          ],
        ),
      ),
    );
  }
}
