import 'package:app/export.dart';

class TermsOfServicePage extends StatefulWidget {
  static const String route = '/TermsOfServicePage';

  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  State<TermsOfServicePage> createState() => _TermsOfServicePageState();
}

class _TermsOfServicePageState extends State<TermsOfServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.termsOfService.r),
      ),
      body: AppListViewBuilder(
        padding: app.screenPadding,
        children: [
          const Text(
              'By using Agora, you agree to our terms and conditions. This includes adhering to community guidelines, respecting intellectual property rights, and maintaining account security. Your compliance ensures a safe and positive experience for all users within the Agora community.'),
        ],
      ),
    );
  }
}
