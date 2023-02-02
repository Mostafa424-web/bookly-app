import 'package:bookly_app/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:flutter/cupertino.dart';

import '../../../../home/presentation/views/widgets/custom_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context , index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          // child: BestSellerListViewItem(),
          child: Text('data'),
        );
      },
    );
  }
}
