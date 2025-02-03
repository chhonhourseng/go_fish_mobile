/// verify_otp_page
import 'package:app/export.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

class VerifyOtpPara {
  final String phone;
  final String key;

  const VerifyOtpPara({
    required this.phone,
    required this.key,
  });
}

class VerifyOtpPage extends StatefulWidget {
  static const String route = '/VerifyOtpPage';

  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  State<VerifyOtpPage> createState() => _VerifyOtpPageState();
}

class _VerifyOtpPageState extends State<VerifyOtpPage> {
  late final VerifyOtpCubit cubit;
  late final RegisterCubit cubitRegister;
  late final TextEditingController otpCodeTextController = TextEditingController();

  VerifyOtpPara? para;

  int _durationCountDown = 120; // 120 seconds.
  bool isShowResendButton = false;

  @override
  void initState() {
    cubit = context.read<VerifyOtpCubit>();
    cubitRegister = context.read<RegisterCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  void onLoadedWidget(BuildContext context) {
    final arg = context.navigate.getArg<VerifyOtpPara>();
    if (arg is VerifyOtpPara) {
      para = arg;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 40,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 22,
        color: AppColor.primaryColor,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xFFEBEBEB),
      ),
    );

    return BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
      listenWhen: (previous, current) => previous.stateStatus != current.stateStatus,
      listener: (context, state) {
        if (state.stateStatus == AppStateStatus.success) {
          app.restart(context);
        } else if (state.stateStatus == AppStateStatus.failure) {
          app.snackBar.show(state.message!, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: const BackArrowWidget(),
          ),
          body: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: 100.rb(l: 0),
                ),
                height: 160,
              ),
              AppListViewBuilder(
                padding: app.screenPadding,
                children: [
                  Text(T.verificationCode.r, style: context.typography.headline3),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: T.enterVerifyCodeWeveSentTo.r + ' ('),
                        TextSpan(
                          text: para?.phone ?? '',
                          style: const TextStyle(
                            color: AppColor.primaryColor,
                          ),
                        ),
                        const TextSpan(text: ')'),
                      ],
                    ),
                    style: context.typography.body3,
                  ),
                  50.sh(),
                  Container(
                    padding: 12.py(),
                    child: Pinput(
                      onTapOutside: (v) => app.focusNew(context),
                      cursor: Container(
                        height: 40,
                        color: generateColor(context),
                        width: 1,
                      ),
                      controller: otpCodeTextController,
                      defaultPinTheme: defaultPinTheme,
                      separatorBuilder: (index) => const SizedBox(width: 15),
                      onCompleted: (code) {
                        otpCodeTextController.text = code;
                        verify();
                      },
                      focusedPinTheme: defaultPinTheme.copyWith(
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: AppColor.primaryColor, width: 2),
                        ),
                      ),
                    ),
                  ),
                  if (isShowResendButton) ...[
                    AppGestureDetector(
                      onTap: () {
                        if (para != null) {
                          context.navigate.pop();
                          cubitRegister.request(data: RegisterRequest(phoneNumber: para!.phone));
                        }
                        isShowResendButton = false;
                        setState(() {});
                      },
                      child: Center(
                        child: Text(
                          T.resent.r,
                          style: context.typography.body3.copyWith(color: AppColor.primaryColor),
                        ),
                      ),
                    ),
                  ] else ...[
                    Center(
                      child: Countdown(
                        seconds: _durationCountDown,
                        build: (BuildContext context, double time) => Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(text: T.resendCodeIn.r + ' '),
                              TextSpan(
                                text: "${time.toInt().toString()} ",
                                style: const TextStyle(
                                  color: AppColor.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          style: context.typography.body3,
                        ),
                        interval: const Duration(seconds: 1),
                        onFinished: () => setState(() => isShowResendButton = true),
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Color generateColor(BuildContext context) => AppColor.primaryButtonColor;

  void verify() {
    if (otpCodeTextController.text.isNotEmpty && para != null) {
      cubit.request(data: VerifyOtpRequest(code: otpCodeTextController.text, key: para!.key));
    } else {
      app.snackBar.show('Validation Fail');
    }
  }
}
