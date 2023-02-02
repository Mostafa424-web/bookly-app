import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:bookly_app/core/errors/failures.dart';
import 'package:bookly_app/core/utlis/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoIpml extends HomeRepo {
  final ApiService apiService;

  HomeRepoIpml(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsetBooks() async {
    try {
      List<BookModel> books = [];
      var data = await apiService.get(
          endPoint:
              'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science');
      for(var item in data['items']){
        try {
          books.add(BookModel.fromJson(item));
        } on Exception catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    }  catch (e) {
      if(e is DioError){
         return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      List<BookModel> books = [];
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&Sorting=relevance&q=Programming');
      for(var item in data['items']){
        try {
          books.add(BookModel.fromJson(item));
        } on Exception catch (e) {
          books.add(BookModel.fromJson(item));
        }
      }
      return right(books);
    }  catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async{
    try {
      List<BookModel> books = [];
      var data = await apiService.get(
          endPoint:
          'volumes?Filtering=free-ebooks&q=subject:Programming');
      for(var item in data['items']){
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    }  catch (e) {
      if(e is DioError){
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
