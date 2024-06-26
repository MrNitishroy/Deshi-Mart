import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

ToastificationItem successMessage(BuildContext context, String message) {
  return Toastification().show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 2),
    title: Text(
      message,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
    ),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    dismissDirection: DismissDirection.horizontal,
    icon: Icon(
      Icons.done_all_rounded,
      color: Theme.of(context).colorScheme.primary,
    ),
    primaryColor: Theme.of(context).colorScheme.primary,
    backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
    borderSide: BorderSide.none,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(5),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
  );
}

ToastificationItem errorMessage(BuildContext context, String message) {
  return Toastification().show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(
      message,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.red,
          ),
    ),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    dismissDirection: DismissDirection.horizontal,
    icon: const Icon(
      Icons.error_rounded,
      color: Colors.red,
    ),
    primaryColor: Colors.red,
    backgroundColor: Colors.red.withOpacity(0.1),
    borderSide: BorderSide.none,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(5),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
  );
}

ToastificationItem warningMessage(BuildContext context, String message) {
  return Toastification().show(
    context: context,
    type: ToastificationType.warning,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 2),
    title: Text(
      message,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Colors.yellow,
          ),
    ),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    dismissDirection: DismissDirection.horizontal,
    icon: const Icon(
      Icons.warning_rounded,
      color: Colors.yellow,
    ),
    primaryColor: Colors.yellow,
    backgroundColor: Colors.yellow.withOpacity(0.1),
    borderSide: BorderSide.none,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(5),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
  );
}
