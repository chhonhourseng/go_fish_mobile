// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:tech/src/constant/index.dart';

// class AppLifecycleEventHandler extends WidgetsBindingObserver {
//   final AsyncCallback? resumeCallBack;
//   final AsyncCallback? suspendingCallBack;

//   bool isPaused = false;

//   AppLifecycleEventHandler({
//     this.resumeCallBack,
//     this.suspendingCallBack,
//   });

//   @override
//   Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
//     appEventBus.fire(EventBusLifecycleEventHandler(state));
//     switch (state) {
//       case AppLifecycleState.resumed:
//         isPaused = false;
//         if (resumeCallBack != null) {
//           await resumeCallBack!();
//         }
//         break;
//       case AppLifecycleState.inactive:
//         isPaused = true;
//         break;
//       case AppLifecycleState.paused:
//         isPaused = true;
//         break;
//       case AppLifecycleState.detached:
//         if (!isPaused) {
//           if (suspendingCallBack != null) {
//             await suspendingCallBack!();
//           }
//         }
//         break;
//       case AppLifecycleState.hidden:
//         isPaused = true;
//         break;
//     }
//   }
// }
