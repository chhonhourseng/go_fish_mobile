import 'dart:async';
import 'package:app/export.dart';
import 'package:dotted_border/dotted_border.dart';

class AppUploadImageForm extends StatelessWidget {
  const AppUploadImageForm({
    super.key,
    this.file,
    this.onChanged,
    this.builder,
    this.isProgressFullSize = false,
    this.aspectRatio,
    this.url,
    this.onSuccess,
    this.validator,
    this.label,
    this.formStyle = FormStyle.style1,
  });

  final String? label;
  final File? file;
  final String? url;
  final ValueChanged<File?>? onChanged;
  final ValueChanged<int?>? onSuccess;
  final Widget? Function(BuildContext)? builder;
  final bool isProgressFullSize;
  final double? aspectRatio;
  final FormFieldValidator<String>? validator;
  final FormStyle formStyle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadFileCubit>(
      create: (context) => getIt<UploadFileCubit>(),
      child: _AppUploadImageFormBuilder(instant: this),
    );
  }
}

class _AppUploadImageFormBuilder extends StatefulWidget {
  final AppUploadImageForm instant;

  const _AppUploadImageFormBuilder({required this.instant});

  @override
  State<_AppUploadImageFormBuilder> createState() => _AppUploadImageFormBuilderState();
}

class _AppUploadImageFormBuilderState extends State<_AppUploadImageFormBuilder> {
  AppUploadImageForm get i => widget.instant;
  late final UploadFileCubit cubit;

  @override
  void initState() {
    cubit = context.read<UploadFileCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  Future<void> onLoadedWidget(BuildContext context) async {}

  bool get isLoading => cubit.state.stateStatus == AppStateStatus.loading && cubit.progress != null;

  bool get isError => cubit.state.stateStatus == AppStateStatus.failure && i.file != null;

  void reUpload() {
    cubit.request(data: i.file);
  }

  void showAction() {
    AppBottomSheet.showAction(
      context,
      children: [
        AppBottomSheetActionModel(text: T.reUpload.r, callbackAction: () => reUpload()),
        AppBottomSheetActionModel(text: T.clear.r, callbackAction: () => i.onChanged?.call(null)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadFileCubit, UploadFileState>(
      listenWhen: (p, c) => p.stateStatus != c.stateStatus,
      listener: (context, state) {
        if (state.stateStatus == AppStateStatus.success) {
          if (cubit.idAttachment != null) {
            i.onSuccess?.call(cubit.idAttachment!);
          }
        } else if (state.stateStatus == AppStateStatus.failure) {
          app.snackBar.show(state.message!, type: SnackBarType.error);
        }
      },
      builder: (context, state) {
        return AppGestureDetector(
          onTap: () {
            if (state.stateStatus == AppStateStatus.loading) return;
            AppBottomSheet.showActionChooseImage(
              context,
              onChanged: (v) {
                cubit.reset();
                i.onSuccess?.call(null);
                i.onChanged?.call(v);
                cubit.request(data: v);
                setState(() {});
              },
            );
          },
          child: FormFieldWidget(
            initialValue: cubit.idAttachment.toString(),
            validator: i.validator,
            contentPadding: 0.p(),
            builder: (c, hasError) {
              return AppGestureDetector(
                onTap: isError ? () => showAction() : null,
                child: i.builder?.call(context) ??
                    Builder(builder: (c) {
                      switch (i.formStyle) {
                        case FormStyle.style2:
                          return stateBuilder(state, builder: (context) {
                            return DottedBorder(
                              borderType: BorderType.RRect,
                              radius: 10.radius(),
                              dashPattern: const [5],
                              color: hasError ? AppColor.dangerDark : AppColor.greyLightI,
                              child: ClipRRect(
                                borderRadius: 10.r(),
                                child: AspectRatio(
                                  aspectRatio: i.aspectRatio ?? 19 / 12,
                                  child: imageBuilder(builder: (context) {
                                    return Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: 10.p(),
                                            decoration: BoxDecoration(
                                              color: AppColor.greyLightII.lighten(75),
                                              shape: BoxShape.circle,
                                            ),
                                            child: const Icon(
                                              Icons.add,
                                              size: 30,
                                            ),
                                          ),
                                          Text(i.label ?? T.uploadPhoto.r,
                                              style: context.typography.body5.copyWith(
                                                color: AppColor.greyLight,
                                              )),
                                          Text('(Max 2 MB)',
                                              style: context.typography.body5.copyWith(
                                                color: AppColor.greyLight,
                                              )),
                                        ].separator((i) => 2.sh()),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            );
                          });
                        case FormStyle.style3:
                          return stateBuilder(state, builder: (context) {
                            return DottedBorder(
                              borderType: BorderType.RRect,
                              radius: 10.radius(),
                              dashPattern: const [3],
                              color: hasError ? AppColor.dangerDark : AppColor.greyLightI,
                              child: ClipRRect(
                                borderRadius: 10.r(),
                                child: Container(
                                  color: AppColor.greyLightII.lighten(50),
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: imageBuilder(builder: (context) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              padding: 10.p(),
                                              decoration: BoxDecoration(
                                                borderRadius: 4.r(),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  const AppImageSvg(
                                                    width: 20,
                                                    path: AppAssets.imageIconSvg,
                                                  ),
                                                  5.sw(),
                                                  Text(
                                                    i.label ?? T.uploadPhoto.r,
                                                    style: context.typography.body5.copyWith(
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            5.sh(),
                                            Text('Better with 1200px X 1200px',
                                                style: context.typography.caption3.copyWith(
                                                  color: AppColor.greyLight,
                                                )),
                                          ].separator((i) => 2.sh()),
                                        ),
                                      );
                                    }),
                                  ),
                                ),
                              ),
                            );
                          });
                        default:
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (i.label != null) ...[
                                Text(i.label!, style: context.typography.body4),
                                5.sh(),
                              ],
                              Container(
                                padding: 10.p(),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: 4.r(),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    stateBuilder(state, builder: (context) {
                                      return ClipRRect(
                                        borderRadius: 4.r(),
                                        child: imageBuilder(
                                          width: 150,
                                          builder: (context) {
                                            return addWidget(100);
                                          },
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ],
                          );
                      }
                    }),
              );
            },
          ),
        );
      },
    );
  }

  Widget imageBuilder({double? width, required WidgetBuilder builder}) {
    return Opacity(
      opacity: isLoading || isError ? 0.5 : 1,
      child: Builder(builder: (c) {
        if (i.file != null) {
          return SizedBox(
            width: width,
            child: Image.file(i.file!),
          );
        } else if (i.url != null) {
          return SizedBox(
            width: width,
            child: AppImageNetworkWidget(
              fit: BoxFit.contain,
              url: i.url,
            ),
          );
        }
        return builder.call(context);
      }),
    );
  }

  Widget stateBuilder(UploadFileState state, {required WidgetBuilder builder}) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        builder.call(context),
        if (isLoading)
          if (i.isProgressFullSize) ...[
            Positioned.fill(
              child: AspectRatio(
                aspectRatio: 1,
                child: CircularProgressIndicator(
                  color: AppColor.green,
                  value: cubit.progress,
                  strokeWidth: 5,
                  backgroundColor: AppColor.green.withOpacity(0.2),
                ),
              ),
            ),
          ] else ...[
            Positioned(
              child: SizedBox(
                width: 60,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(
                    color: AppColor.green,
                    value: cubit.progress,
                    strokeWidth: 5,
                    backgroundColor: AppColor.green.withOpacity(0.2),
                  ),
                ),
              ),
            ),
          ],
        if (isError)
          const Positioned(
            child: Icon(Icons.error_outline, color: AppColor.danger, size: 30),
          ),
      ],
    );
  }

  Widget addWidget(double size, {GestureTapCallback? onTap}) {
    return AppGestureDetector(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxHeight: size, minHeight: size),
        width: size,
        decoration: BoxDecoration(
          color: AppColor.greyLightII,
          borderRadius: 4.r(),
        ),
        child: const Icon(Icons.add, size: 35),
      ),
    );
  }
}
