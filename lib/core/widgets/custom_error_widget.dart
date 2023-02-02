import 'package:bookly_app/core/utlis/styles.dart';
import 'package:flutter/cupertino.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({Key? key, required this.errorMessage}) : super(key: key);
final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage ,
        textAlign: TextAlign.center,
        style: Styles.textStyle18,
      ),
    );
  }
}
