import 'package:app/export.dart';

class UpdateUserInfoPage extends StatefulWidget {
  static const String route = '/UpdateUserInfoPage';

  const UpdateUserInfoPage({Key? key}) : super(key: key);

  @override
  State<UpdateUserInfoPage> createState() => _UpdateUserInfoPageState();
}

class _UpdateUserInfoPageState extends State<UpdateUserInfoPage> {
  late final UpdateUserInfoCubit cubit;
  final TextEditingController email = TextEditingController();
  GenderType gender = GenderType.male;
  final TextEditingController username = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    cubit = context.read<UpdateUserInfoCubit>();
    email.text = app.user!.email ?? '';
    username.text = app.user!.username;
    gender = app.user!.getGender;
    super.initState();
  }

  void submit() {
    if (formKey.currentState?.validate() ?? false) {
      cubit.request(
        data: UpdateUserInfoRequest(
          email: email.text,
          gender: gender,
          username: username.text,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateUserInfoCubit, UpdateUserInfoState>(
      listenWhen: (p, c) => p.stateStatus != c.stateStatus,
      listener: (context, state) {
        if (state.stateStatus == AppStateStatus.success) {
          context.navigate.pop();
          app.snackBar.show(T.successFul.r, type: SnackBarType.success);
        } else if (state.stateStatus == AppStateStatus.failure) {
          app.snackBar.show(state.message!, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const BackArrowWidget(),
            title: Text(T.updateUserInfo.r),
          ),
          body: Form(
            key: formKey,
            child: AppListViewBuilder(padding: app.screenPadding, children: [
              TextFieldWidget(
                controller: username,
                label: T.username.r,
                validator: (v) => app.validation.require(v, T.username.r),
              ),
              GenderField(
                type: gender,
                validator: (v) => app.validation.require(v, T.gender.r),
                onChanged: (v) => setState(() => gender = v),
              ),
              TextFieldWidget(
                controller: email,
                validator: (v) => app.validation.isEmail(v),
                label: T.email.r,
              ),
            ].separator((i) => 20.sh())),
          ),
          bottomNavigationBar: AppBottomWrapper(
            child: ButtonWrapper(
              isLoading: state.stateStatus == AppStateStatus.loading,
              child: SizedBox(
                width: context.mediaQuery.size.width,
                child: FilledButton(onPressed: () => submit(), child: Text(T.updateUserInfo.r)),
              ),
            ),
          ),
        );
      },
    );
  }
}
