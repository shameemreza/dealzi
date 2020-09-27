import 'package:flutter/material.dart';
import 'package:dealzi/Auth/checkout_navigator.dart';
import 'package:dealzi/Lang/locales.dart';
import 'package:dealzi/Pages/Search/cart.dart';
import 'package:dealzi/Pages/Search/search_result.dart';
import 'package:dealzi/Pages/User/wishlist.dart';
import 'package:dealzi/Theme/colors.dart';

class Product {
  Product(this.image, this.productName, this.productType, this.price);
  String image;
  String productName;
  String productType;
  String price;
}

class CategoryProduct extends StatefulWidget {
  final String title;

  CategoryProduct(this.title);

  @override
  _CategoryProductState createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Product> products = [
      Product("assets/ProductImages/onion.png", locale.freshRedOnios, "Angshuk",
          "\$30.0"),
      Product("assets/ProductImages/tomato.png", locale.freshRedTomatoes,
          "Salvin Shop", "\$44.0"),
      Product("assets/ProductImages/Potatoes.png", locale.mediumPotatoes,
          "Aarish Mart", "\$29.0"),
      Product("assets/ProductImages/lady finger.png", locale.freshLadiesFinger,
          "Wasif Shop", "\$32.0"),
      Product("assets/ProductImages/Garlic.png", locale.freshGarlic, "Pajeroma",
          "\$30.0"),
      Product("assets/ProductImages/Cauliflower.png", locale.cauliFlower,
          "Dipanto", "\$35.0"),
      Product("assets/ProductImages/lady finger.png", locale.freshLadiesFinger,
          "Shimahin", "\$32.0"),
      Product("assets/ProductImages/Garlic.png", locale.freshGarlic, "Pajeroma",
          "\$30.0"),
      Product("assets/ProductImages/Cauliflower.png", locale.cauliFlower,
          "Appbuff", "\$35.0"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: kMainTextColor),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: ImageIcon(AssetImage(
              'assets/ic_cart.png',
            )),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CheckOutNavigator()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: buildGridView(products),
      ),
    );
  }
}
