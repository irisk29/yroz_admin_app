import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yroz_admin/DTO/product.dart';
import 'package:yroz_admin/DTO/purchase.dart';
import 'package:yroz_admin/DataLayer/admin_metrics.dart';

class HistoryPurchaseItem extends StatefulWidget {
  final Purchase purchase;
  final String storeName;

  const HistoryPurchaseItem(this.purchase, this.storeName);

  @override
  _HistoryPurchaseItemState createState() => _HistoryPurchaseItemState();
}

class _HistoryPurchaseItemState extends State<HistoryPurchaseItem> {
  var _expanded = false;
  late List<Product> purchaseProducts = [];

  Future<List<Product>> _getProducts() async {
    var res = await AdminMetrics()
        .getPurchaseProduct(widget.purchase.transactionId);
    if (res.getTag()) {
      setState(() => purchaseProducts = res.getValue()!);
      return res.getValue()!;
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    final creditAmount = widget.purchase.creditAmount.toStringAsFixed(2);
    final cashBackAmount = widget.purchase.cashBackAmount.toStringAsFixed(2);
    final purchaseDate =
    DateFormat('dd/MM/yyyy HH:mm').format(widget.purchase.purchaseDate);
    final deviceSize = MediaQuery.of(context).size;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeIn,
      height: _expanded
          ? (purchaseProducts.length > 0
          ? deviceSize.height * 0.025 +
          purchaseProducts.length * deviceSize.height * 0.05
          : deviceSize.height * 0.05) +
          deviceSize.height * 0.175
          : deviceSize.height * 0.175,
      child: Card(
        margin: EdgeInsets.only(
            right: deviceSize.width * 0.05,
            left: deviceSize.width * 0.05,
            top: deviceSize.height * 0.01,
            bottom: deviceSize.height * 0.01),
        child: Center(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              ListTile(
                title: Text(widget.storeName,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "Credit amount:  \€${creditAmount}\nCash-back amount:  \€${cashBackAmount}\n${purchaseDate}"),
                trailing: IconButton(
                  icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () async {
                    final productsTemp = await _getProducts();
                    setState(() {
                      _expanded = !_expanded;
                      purchaseProducts = productsTemp;
                    });
                  },
                ),
              ),
              _expanded
                  ? AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeIn,
                height: purchaseProducts.length > 0
                    ? deviceSize.height * 0.025 +
                    purchaseProducts.length * deviceSize.height * 0.05
                    : deviceSize.height * 0.05,
                child: purchaseProducts.length > 0
                    ? ListTile(
                  title: Text(
                    "Online Purchase Producs",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  subtitle: ListView.builder(
                    itemBuilder: (context, index) {
                      var product = purchaseProducts[index];
                      return Padding(
                        padding: EdgeInsets.only(
                            top: deviceSize.height * 0.01,
                            bottom: deviceSize.height * 0.01),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                          children: [
                            Text(product.productName),
                            Text(
                                '${product.amount.toInt()} X \€${product.price.toStringAsFixed(2)}'),
                          ],
                        ),
                      );
                    },
                    itemCount: purchaseProducts.length,
                  ),
                )
                    : ListTile(
                  title: Center(child: Text("Physical Purchase")),
                  subtitle:
                  Center(child: Text("No Products Details")),
                ),
              )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
