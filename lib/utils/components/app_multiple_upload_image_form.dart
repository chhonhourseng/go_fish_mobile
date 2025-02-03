import 'package:app/export.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class AppMultipleUploadImageForm extends StatelessWidget {
  const AppMultipleUploadImageForm({
    super.key,
    this.files,
    this.onChanged,
    this.onSuccess,
    this.selectedAssets,
    this.onSelectedAssets,
    this.url,
    this.onRemoveUrl,
    this.validator,
    this.maxImage = 5,
    this.label,
    this.formStyle = FormStyle.style1,
  });

  final String? label;
  final List<File>? files;
  final List<ImageResponse>? url;
  final ValueChanged<List<File>>? onChanged;
  final ValueChanged<List<ImageResponse>>? onRemoveUrl;
  final ValueChanged<List<int>>? onSuccess;
  final List<AssetEntity>? selectedAssets;
  final ValueChanged<List<AssetEntity>>? onSelectedAssets;
  final FormFieldValidator<String>? validator;
  final int maxImage;
  final FormStyle formStyle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UploadFilesCubit>(
      create: (context) => getIt<UploadFilesCubit>(),
      child: _AppMultipleUploadImageFormBuilder(instant: this),
    );
  }
}

class _AppMultipleUploadImageFormBuilder extends StatefulWidget {
  final AppMultipleUploadImageForm instant;

  const _AppMultipleUploadImageFormBuilder({required this.instant});

  @override
  State<_AppMultipleUploadImageFormBuilder> createState() => _AppMultipleUploadImageFormBuilderState();
}

class _AppMultipleUploadImageFormBuilderState extends State<_AppMultipleUploadImageFormBuilder> {
  AppMultipleUploadImageForm get i => widget.instant;
  late final UploadFilesCubit cubit;

  int get currentCount => (i.url?.length ?? 0) + (i.files?.length ?? 0);

  int get max => i.maxImage - currentCount;

  @override
  void initState() {
    cubit = context.read<UploadFilesCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  Future<void> onLoadedWidget(BuildContext context) async {}

  void success() {
    i.onSuccess?.call(cubit.progress.entries.map((e) => e.value.idAttachment!).toList());
  }

  void reUpload() {
    cubit.request(data: i.files);
  }

  void showAction() {
    AppBottomSheet.showAction(
      context,
      children: [
        AppBottomSheetActionModel(text: T.reUpload.r, callbackAction: () => reUpload()),
      ],
    );
  }

  void chooseImage(UploadFilesState state) {
    if (state.stateStatus == AppStateStatus.loading) return;
    if (max < 1) return;
    AppBottomSheet.showActionChooseImage(
      context,
      maxAssets: max,
      selectedAssets: i.selectedAssets,
      onSelectedAssets: i.onSelectedAssets,
      onMultipleChanged: (v) {
        List<File>? files = i.files;
        if (i.files?.isNotEmpty ?? false) {
          for (var element in v) {
            int index = i.files!.indexWhere((e) => e.path == element.path);
            if (index == -1) {
              files = [...files!, element];
            }
          }
        } else {
          files = v;
        }
        if (kDebugMode) {}
        i.onChanged?.call(files ?? []);
        setState(() {});
        cubit.request(data: files);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UploadFilesCubit, UploadFilesState>(
      listenWhen: (p, c) => p.stateStatus != c.stateStatus,
      listener: (context, state) {
        if (state.stateStatus == AppStateStatus.success) {
          if (cubit.progress.isNotEmpty) {
            success();
          }
        }
      },
      builder: (context, state) {
        return FormFieldWidget(
          validator: i.validator,
          contentPadding: 0.p(),
          builder: (c, hasError) {
            switch (i.formStyle) {
              case FormStyle.style3:
                return DottedBorder(
                  borderType: BorderType.RRect,
                  radius: 10.radius(),
                  dashPattern: const [3],
                  color: hasError ? AppColor.dangerDark : AppColor.greyLightI,
                  child: ClipRRect(
                    borderRadius: 10.r(),
                    child: Container(
                      color: AppColor.greyLightII.lighten(50),
                      padding: 10.p(),
                      child: constraintsBuilder(
                          minHeight: 0.5,
                          builder: (c, size) {
                            if (currentCount == 0)
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AppGestureDetector(
                                      onTap: () => chooseImage(state),
                                      child: Container(
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
                                    ),
                                    5.sh(),
                                    Text('Better with 1200px X 1200px',
                                        style: context.typography.caption3.copyWith(
                                          color: AppColor.greyLight,
                                        )),
                                  ].separator((i) => 2.sh()),
                                ),
                              );
                            return Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                addWidget(size, onTap: () => chooseImage(state)),
                                ...itemsBuilder(size),
                              ],
                            );
                          }),
                    ),
                  ),
                );
              default:
                return ClipRRect(
                  borderRadius: 4.r(),
                  child: Container(
                    padding: 10.p(),
                    color: Colors.white,
                    child: constraintsBuilder(builder: (c, size) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              addWidget(size, onTap: () => chooseImage(state)),
                              ...itemsBuilder(size),
                            ],
                          ),
                          10.sh(),
                          Text('$currentCount/${i.maxImage}', style: context.typography.caption4)
                        ],
                      );
                    }),
                  ),
                );
            }
          },
        );
      },
    );
  }

  Widget constraintsBuilder({double? minHeight, required Widget Function(BuildContext context, double size) builder}) {
    return Container(
      width: context.mediaQuery.size.width,
      constraints: BoxConstraints(
        minHeight: context.mediaQuery.size.width * (minHeight ?? 0.22),
      ),
      child: LayoutBuilder(builder: (context, constant) {
        final double size = (constant.minWidth / 4) - (8);
        return builder.call(context, size);
      }),
    );
  }

  List<Widget> itemsBuilder(double size) {
    return [
      if (i.url?.isNotEmpty ?? false)
        ...List.from(i.url!.map((e) {
          return item(
              size: size,
              data: e,
              onRemove: () {
                i.url?.removeWhere((element) => element.id == e.id);
                i.onRemoveUrl?.call(i.url ?? []);
              });
        })),
      if (i.files?.isNotEmpty ?? false)
        ...List.from(i.files!.map(
          (e) {
            UploadFilesProgress? v;
            if (cubit.progress.containsKey(e.path)) {
              v = cubit.progress[e.path];
            }
            bool isLoading = v?.stateStatus == AppStateStatus.loading && v?.progress != null;
            bool isError = v?.stateStatus == AppStateStatus.failure;
            if (kDebugMode) {}
            return AppGestureDetector(
              onTap: isError ? () => showAction() : null,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  item(
                      size: size,
                      data: e,
                      onRemove: () {
                        i.files?.remove(e);
                        cubit.remove(e.path);
                        i.onChanged?.call(i.files ?? []);
                        success();
                      }),
                  if (isLoading)
                    Positioned(
                      child: SizedBox(
                        width: size - 40,
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: CircularProgressIndicator(
                            color: AppColor.green,
                            value: v?.progress,
                            strokeWidth: 5,
                            backgroundColor: AppColor.green.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  if (isError)
                    const Positioned(
                      child: Icon(Icons.error_outline, color: AppColor.danger, size: 30),
                    ),
                ],
              ),
            );
          },
        ))
    ];
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

  Widget item({
    required double size,
    required dynamic data,
    required GestureTapCallback onRemove,
  }) {
    return ClipRRect(
      borderRadius: 4.r(),
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
            constraints: BoxConstraints(maxHeight: size, minHeight: size),
            width: size,
            child: data is File
                ? Image.file(data, fit: BoxFit.cover)
                : (data is ImageResponse
                    ? AppImageNetworkWidget(
                        url: data.attachmentUrl,
                        fit: BoxFit.cover,
                      )
                    : 0.s()),
          ),
          Positioned(
            top: 3,
            right: 3,
            child: AppGestureDetector(
              onTap: onRemove,
              child: Container(
                padding: 5.p(),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.4),
                  borderRadius: 1000.r(),
                ),
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
