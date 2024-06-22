import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

ToastificationItem successMessage(BuildContext context, String message) {
  return Toastification().show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(message,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            )),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    dismissDirection: DismissDirection.horizontal,
    icon: const Icon(
      Icons.done_all_rounded,
      color: Colors.white,
    ),
    primaryColor: Theme.of(context).colorScheme.primary,
    backgroundColor: Theme.of(context).colorScheme.onSurface,
    foregroundColor: Theme.of(context).colorScheme.onSurface,
    borderSide: BorderSide.none,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(5),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}

ToastificationItem errorMessage(BuildContext context, String message) {
  return Toastification().show(
    context: context,
    type: ToastificationType.error,
    style: ToastificationStyle.minimal,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(message,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            )),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    dismissDirection: DismissDirection.horizontal,
    icon: const Icon(Icons.check),
    primaryColor: Colors.red,
    backgroundColor: Colors.red.withOpacity(0.8),
    foregroundColor: Colors.red,
    borderSide: BorderSide.none,
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(5),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}

ToastificationItem warningMessage(BuildContext context, String message) {
  return Toastification().show(
    context: context,
    type: ToastificationType.warning,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 5),
    title: Text(message,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            )),
    alignment: Alignment.bottomCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    dismissDirection: DismissDirection.horizontal,
    icon: const Icon(Icons.warning),
    primaryColor: Colors.yellow,
    backgroundColor: Colors.yellow.withOpacity(0.8),
    foregroundColor: Colors.yellow,
    borderSide: BorderSide(color: Colors.yellow, width: 1),
    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(5),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}
