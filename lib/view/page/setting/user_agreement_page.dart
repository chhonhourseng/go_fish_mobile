import 'package:app/export.dart';

class UserAgreementPage extends StatefulWidget {
  static const String route = '/UserAgreementPage';

  const UserAgreementPage({Key? key}) : super(key: key);

  @override
  State<UserAgreementPage> createState() => _UserAgreementPageState();
}

class _UserAgreementPageState extends State<UserAgreementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.userAgreement.r),
      ),
      body: AppListViewBuilder(
        padding: app.screenPadding,
        children: [
          const Text('By using Agora, you agree to our terms and conditions. This includes adhering to community guidelines, respecting intellectual property rights, and maintaining account security. Your compliance ensures a safe and positive experience for all users within the Agora community.'),
        ],
      ),
    );
  }
}
