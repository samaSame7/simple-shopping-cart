import 'package:flutter/material.dart';
import 'package:practice/ui/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:practice/ui/screens/product_dm/product_dm.dart';
import 'package:practice/ui/utils/app_assets.dart';
import 'package:practice/ui/utils/app_colors.dart';
import 'package:practice/ui/utils/app_styles.dart';
import 'package:practice/ui/widgets/app_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartProvider cartProvider;

  @override
  Widget build(BuildContext context) {
    cartProvider = Provider.of(context);
    final products = cartProvider.cartItems;
    final totalPrice = cartProvider.totalPrice;

    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: buildAppBar(context, products.length),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildCheckPart(totalPrice),
                    const SizedBox(height: 24),
                    Text(
                      "${products.length} Items",
                      style: AppTextStyles.grey14SemiBold,
                    ),
                    const SizedBox(height: 16),
                    Expanded(child: buildShoppedItems(products)),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              AppButton(onPress: () {}, title: "Checkout"),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, int count) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text("My Cart", style: AppTextStyles.black18SemiBold),
      centerTitle: true,
      leading: InkWell(
        onTap: () => Navigator.pop(context),
        child: const Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.blue,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(AppAssets.icBasket),
              if (count > 0)
                Positioned(
                  right: 10,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "$count",
                      style: AppTextStyles.white18Medium.copyWith(fontSize: 12),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildCheckPart(int total) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text("Items Total", style: AppTextStyles.grey14SemiBold),
              const Spacer(),
              Text("EGP $total", style: AppTextStyles.black16SemiBold),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text("Shipping Fee", style: AppTextStyles.grey14SemiBold),
              const Spacer(),
              Text(
                "Free",
                style: AppTextStyles.black16SemiBold.copyWith(
                  color: const Color(0xff06AD00),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text("Total", style: AppTextStyles.grey14SemiBold),
              const Spacer(),
              Text("EGP $total", style: AppTextStyles.black16SemiBold),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildShoppedItems(List<ProductDm> products) {
    return ListView.separated(
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return buildShoppedItem(products[index]);
      },
    );
  }

  Widget buildShoppedItem(ProductDm product) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsetsGeometry.all(12),
              child: Image.asset(product.imgPath),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: AppTextStyles.black16SemiBold,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              product.description,
                              style: AppTextStyles.grey12regular,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      removeFromCart(product),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.price, style: AppTextStyles.black16SemiBold),
                      buildStepperRow(product),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildStepperRow(ProductDm product) {
    return Row(
      children: [
        InkWell(
          onTap: () => cartProvider.decrementQuantity(product),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.remove, size: 18, color: AppColors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${product.quantity}",
            style: AppTextStyles.black16SemiBold,
          ),
        ),
        InkWell(
          onTap: () => cartProvider.incrementQuantity(product),
          child: Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.add, size: 18, color: Colors.white),
          ),
        ),
      ],
    );
  }

  InkWell removeFromCart(ProductDm product) {
    return InkWell(
      onTap: () => cartProvider.removeFromCart(product),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
        child: const Icon(Icons.delete_outline, color: Colors.red, size: 20),
      ),
    );
  }
}
