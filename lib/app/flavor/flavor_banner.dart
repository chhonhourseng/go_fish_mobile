import 'package:app/export.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (FlavorConfig.instance!.environment == FlavorEnvironment.PROD) {
      return child;
    } else {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Banner(
          message: FlavorConfig.instance!.name.isNotEmpty
              ? FlavorConfig.instance!.name
              : FlavorConfig.instance!.name.toString().split('.').last,
          location: FlavorConfig.instance!.location,
          color: FlavorConfig.instance!.color,
          child: child,
        ),
      );
    }
  }
}
