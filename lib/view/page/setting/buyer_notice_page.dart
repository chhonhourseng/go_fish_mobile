/// buyer_notice_page
import 'package:app/export.dart';

class BuyerNoticePage extends StatefulWidget {
  static const String route = '/BuyerNoticePage';

  const BuyerNoticePage({Key? key}) : super(key: key);

  @override
  State<BuyerNoticePage> createState() => _BuyerNoticePageState();
}

class _BuyerNoticePageState extends State<BuyerNoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.buyerNotice.r),
      ),
      body: AppListViewBuilder(
        padding: app.screenPadding,
        children: [
          const Text(
            'Welcome to the Agora platform! We’re thrilled to have you here and are committed to providing you with a seamless and secure experience for all your buying needs. This notice is designed to inform you about important aspects of using the Agora app to ensure a smooth and enjoyable shopping journey.',
          ),
        ].separator((i) => 20.sh()),
      ),
    );
  }
}
