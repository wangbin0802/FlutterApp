import 'package:flutter/material.dart';

class Product {
  String name;
  Product(this.name);
}

class ShoppingListPage extends StatefulWidget {

  final List<Product> products;
  ShoppingListPage({required Key key, required this.products}) : super(key: key);

  @override
  ShoppingListState createState() {
    return ShoppingListState();
  }
}

class ShoppingListState extends State<ShoppingListPage> {
  Set<Product> shoppingCart = Set<Product>();

  void handleProduct(Product product, bool incart) {
    setState(() {
      if (incart) {
        shoppingCart.add(product);
      } else {
        shoppingCart.remove(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping List"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
              return ShoppingListItem(
                product: product,
                inCart: shoppingCart.contains(product),
                onCartChanged: handleProduct,
              );
        }).toList(),
      ),
    );
  }

}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({required Product product, required this.inCart, required this.onCartChanged})
      : product = product,
        super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}