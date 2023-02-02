import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../../core/utlis/assets.dart';
import '../../../../../core/utlis/styles.dart';
import 'best_seller_.dart';
import 'best_seller_list_view_item.dart';
import 'custom_app_bar.dart';
import 'custom_list_view_item.dart';
import 'featured_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  const[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: CustomAppBar(),
                ),
                FeaturedBooksListView(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Text(
                    'NewSet Books',
                    style: Styles.textStyle18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      const SliverFillRemaining(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: BestSellerListView(),
        ),
      )
      ],
    );
  }
}



