import 'package:bookly_app/Features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/book_model/book_model.dart';

abstract class FeaturedBooksState extends Equatable {
   const FeaturedBooksState();

  @override
  List<Object> get props =>  [];

}
class FeaturedBooksInitial extends FeaturedBooksState{}
class FeaturedBooksLoading extends FeaturedBooksState{}
class FeaturedBooksFailure extends FeaturedBooksState{
  final String errorMessage;

  const FeaturedBooksFailure(this.errorMessage);
}
class FeaturedBooksSuccess extends FeaturedBooksState{
  final List<BookModel> books;

  const FeaturedBooksSuccess(this.books);

}