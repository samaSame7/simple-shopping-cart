import 'package:flutter/material.dart';
import 'package:practice/ui/providers/cart_provider.dart';
import 'package:practice/ui/screens/cart_screen/cart_screen.dart';
import 'package:practice/ui/screens/product_dm/product_dm.dart';
import 'package:practice/ui/widgets/app_button.dart';
import 'package:provider/provider.dart';
import 'package:practice/ui/utils/app_assets.dart';
import 'package:practice/ui/utils/app_colors.dart';
import 'package:practice/ui/utils/app_constants.dart';
import 'package:practice/ui/utils/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildScreenHeader(context, cartProvider.itemsCount),
              const SizedBox(height: 24),
              Text("Recommendations", style: AppTextStyles.black16SemiBold),
              Expanded(child: buildProductsWidget()),
            ],
          ),
        ),
      ),
    );
  }

  Row buildScreenHeader(BuildContext context, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(AppAssets.appLogo),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          child: Badge(
            label: Text("$count"),
            isLabelVisible: count > 0,
            backgroundColor: Colors.red,
            child: Image.asset(AppAssets.icBasket),
          ),
        ),
      ],
    );
  }

  GridView buildProductsWidget() {
    return GridView.builder(
      padding: const EdgeInsets.only(top: 12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.59,
        crossAxisSpacing: 12,
        mainAxisSpacing: 10,
      ),
      itemCount: AppConstants.products.length,
      itemBuilder: (context, index) {
        final product = AppConstants.products[index];
        return buildProductCard(product);
      },
    );
  }

  Widget buildProductCard(ProductDm product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .18,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(product.imgPath),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                product.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.black16SemiBold,
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber),
                  const SizedBox(width: 4),
                  Text(product.rate, style: AppTextStyles.black16SemiBold),
                  const SizedBox(width: 4),
                  Text(
                    "(${product.reviews})",
                    style: AppTextStyles.grey14SemiBold,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(product.price, style: AppTextStyles.black16SemiBold),

                  InkWell(
                    onTap: () {
                      Provider.of<CartProvider>(
                        context,
                        listen: false,
                      ).addToCart(product);

                      showShoppedSheet(context, product);
                    },
                    child: Image.asset(AppAssets.icBasket),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void showShoppedSheet(BuildContext context, ProductDm product) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Text("Added to cart", style: AppTextStyles.black16SemiBold),
                  const SizedBox(width: 8),
                  const Icon(
                    Icons.check_circle,
                    color: Color(0xff06AD00),
                    size: 24,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(product.description, style: AppTextStyles.grey14SemiBold),
              const SizedBox(height: 16),
              AppButton(
                title: "View Cart",
                onPress: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartScreen()),
                  );
                },
              ),
              const SizedBox(height: 12),
              AppButton(
                onPress: () {
                  Navigator.pop(context);
                },
                title: "Continue Shopping",
                backColor: Colors.white,
                textStyle: AppTextStyles.blue18SemiBold,
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
