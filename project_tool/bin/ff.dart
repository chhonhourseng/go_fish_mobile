import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:ff/commands/add_translation.dart';
import 'package:ff/commands/auto_export.dart';
import 'package:ff/commands/build.dart';
import 'package:ff/commands/compile_tool.dart';
import 'package:ff/commands/generate_asset_const.dart';
import 'package:ff/commands/make_asset.dart';
import 'package:ff/commands/set_app_id.dart';
import 'package:ff/commands/set_app_name.dart';
import 'package:ff/commands/set_app_version.dart';
import 'package:ff/commands/set_deeplink_scheme.dart';
import 'package:ff/commands/set_env.dart';
import 'package:ff/commands/sign_apk.dart';
import 'package:ff/commands/submit_release.dart';
import 'package:ff/commands/translate.dart';
import 'package:ff/helpers.dart';

void main(List<String> arguments) async {
  // GenerateAssetConstCommand.generateAssetConstants();
  // return;
  try {
    final runner = CommandRunner('ff', 'Command line for this project')
      // ..addCommand(SetAppVersionCommand())
      // ..addCommand(SetAppIdCommand())
      // ..addCommand(SignApkCommand())
      // ..addCommand(SetAppNameCommand())
      // ..addCommand(SetDeeplinkSchemeCommand())
      // ..addCommand(BuildProjectCommand())
      ..addCommand(AutoExportCommand())
      ..addCommand(GenerateAssetConstCommand())
      ..addCommand(AddTranslationCommand())
      ..addCommand(CompileToolCommand())
      // ..addCommand(TranslateCommand())
      ..addCommand(MakeAssetCommand())
      ..addCommand(SubmitReleaseCommand())
      ..addCommand(SetEnvironmentCommand());

    await runner.run(arguments);
  } on UsageException catch (e) {
    print(e);
  }
}
