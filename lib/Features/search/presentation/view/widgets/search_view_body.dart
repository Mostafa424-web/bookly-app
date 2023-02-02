import 'package:bookly_app/core/utlis/styles.dart';
import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  const [
        CustomSearchTextField(),
        SizedBox(
          height: 16,
        ),
        Text(
          'Search Result',
          style: Styles.textStyle18,
        ),
        SizedBox(
          height: 16,
        ),
        SearchResultListView(),
      ],
    );
  }
}
