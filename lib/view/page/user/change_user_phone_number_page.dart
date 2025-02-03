import 'package:app/export.dart';

class ChangeUserPhoneNumberPage extends StatefulWidget {
  static const String route = '/ChangeUserPhoneNumberPage';

  const ChangeUserPhoneNumberPage({Key? key}) : super(key: key);

  @override
  State<ChangeUserPhoneNumberPage> createState() => _ChangeUserPhoneNumberPageState();
}

class _ChangeUserPhoneNumberPageState extends State<ChangeUserPhoneNumberPage> {
  late final ChangeUserPhoneNumberCubit cubit;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumber = TextEditingController();

  @override
  void initState() {
    cubit = context.read<ChangeUserPhoneNumberCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  Future<void> onLoadedWidget(BuildContext context) async {}

  void submit() {
    if (formKey.currentState?.validate() ?? false) {
      cubit.request(
        data: ChangeUserPhoneNumberRequest(
          phoneNumber: phoneNumber.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.changePhoneNumber.r),
      ),
      body: BlocBuilder<ChangeUserPhoneNumberCubit, ChangeUserPhoneNumberState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: AppListViewBuilder(padding: app.screenPadding, children: [
              PhoneFieldWidget(
                controller: phoneNumber,
              ),
              ButtonWrapper(
                isLoading: state.stateStatus == AppStateStatus.loading,
                child: SizedBox(
                  width: context.mediaQuery.size.width,
                  child: FilledButton(
                    onPressed: () => submit(),
                    child: Text(T.changePhoneNumber.r),
                  ),
                ),
              ),
            ].separator((i) => 20.sh())),
          );
        },
      ),
    );
  }
}
