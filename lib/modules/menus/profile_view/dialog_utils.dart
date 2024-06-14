import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static Future<void> messageSuccess(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
  }) async {
    final snackBar = SnackBar(
      content: AwesomeSnackbarContent(
        title: title ?? 'Sucess',
        message: message,
        contentType: ContentType.success,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static Future<void> messsageError(
    BuildContext context, {
    required String message,
    String? title,
    Duration? duration,
  }) async {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title ?? 'Error',
        message: message,
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  // static Future<T?> info<T>(
  //   BuildContext context, {
  //   String? title,
  //   String? content,
  //   String? lottiePath,
  //   EdgeInsets? lottiePadding,
  //   String? labelButton,
  //   VoidCallback? onClicked,
  //   Widget? customWidget,
  //   bool isBackAfterYes = true,
  //   EdgeInsets? insetPadding,
  // })async {
  //   return await showAnimate
  // }
}
