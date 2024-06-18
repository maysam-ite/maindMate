import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:maindmate/main.dart';

// ignore: must_be_immutable
class EmptyData extends StatelessWidget {
  EmptyData({super.key, required this.icon, required this.message, this.onTap});
  final IconData icon;
  final String message;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: onTap,
              child: Icon(
                icon,
                color: appTheme.primary,
                size: 60,
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(0, 0),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  tr(message),
                  textAlign: TextAlign.center,
                  style: appTheme.text14.copyWith(
                    color: appTheme.primary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
