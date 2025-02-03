import 'package:app/export.dart';

class MoreWidget extends StatelessWidget {
  const MoreWidget({super.key, this.onTap, this.icon});

  final GestureTapCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      child: Container(
        padding: 6.p(),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.primaryColor.withOpacity(0.2),
        ),
        child: Icon(icon ?? Icons.more_horiz_outlined, size: 19),
      ),
    );
  }
}
