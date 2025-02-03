/// privacy_policy_page
import 'package:app/export.dart';

class PrivacyPolicyPage extends StatefulWidget {
  static const String route = '/PrivacyPolicyPage';

  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicyPage> createState() => _PrivacyPolicyPageState();
}

class _PrivacyPolicyPageState extends State<PrivacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.privacyPolicy.r),
      ),
      body: AppListViewBuilder(
        padding: app.screenPadding,
        children: [
          const Text('At Agora, safeguarding your privacy is paramount. We collect limited personal information for account creation and transaction purposes. Your data is used solely for enhancing your experience on our platform. We prioritize data security and do not share your information without your consent.'),
        ],
      ),
    );
  }
}
