import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/featured_similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/manager/similar_books_cubit/similar_books_state.dart';
import 'package:bookly_app/core/utlis/assets.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_inaicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_list_view_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit,SimilarBooksState>(
      builder: (context,state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context , index) {
                return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CustomListViewItem(imageUrl: state.books[index].volumeInfo.imageLinks?.thumbnail ?? '',),
                );
              },
            ),
          );
        } else if(state is SimilarBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }else{
          return const CustomLoadingIndicator();
        }
      }
    );
  }
}
