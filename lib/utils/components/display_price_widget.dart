import 'package:app/export.dart';

class DisplayPriceWidget extends StatelessWidget {
  final int? price;
  final int? subPrice;
  final String currency;
  final Color? color;
  final TextStyle? style;

  const DisplayPriceWidget({super.key, required this.subPrice, required this.price, this.currency = '\$', this.color, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RichText(
          text: TextSpan(
            text: "$currency",
            style: style ??
                context.textTheme.displaySmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
            children: [
              TextSpan(
                text: "$price ",
                style: style ??
                    context.textTheme.displaySmall?.copyWith(
                      color: color,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
              ),
              if (price != subPrice && subPrice != null) ...[
                TextSpan(
                  text: "$currency$subPrice",
                  style: style ??
                      context.textTheme.labelSmall?.copyWith(
                        decoration: TextDecoration.lineThrough,
                        color: const Color(0xff808080),
                        fontSize: 14,
                      ),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
