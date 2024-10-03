import 'package:flutter_foreground_task/flutter_foreground_task.dart';

class ForegroundController {
  ForegroundController._();

  static ForegroundController? _instance;

  static ForegroundController getInstance() =>
      _instance ??= ForegroundController._();

  void initialize() {
    _initForegroundTask();
    _startService();
  }

  void _initForegroundTask() {
    FlutterForegroundTask.init(
      androidNotificationOptions: AndroidNotificationOptions(
        channelId: 'foreground_service',
        channelName: 'local_notification.foreground.title',
        channelDescription: 'local_notification.foreground.text',
        channelImportance: NotificationChannelImportance.MAX,
        priority: NotificationPriority.MAX,
      ),
      iosNotificationOptions: const IOSNotificationOptions(
        showNotification: true,
        playSound: true,
      ),
      foregroundTaskOptions: ForegroundTaskOptions(
        eventAction: ForegroundTaskEventAction.repeat(5000),
        autoRunOnBoot: true,
        allowWakeLock: true,
        allowWifiLock: true,
      ),
    );
  }

  void _startService() async {
    if (await FlutterForegroundTask.isRunningService) {
      await FlutterForegroundTask.restartService();
      return;
    }

    await FlutterForegroundTask.startService(
      serviceId: 500,
      notificationTitle: 'local_notification.foreground.title',
      notificationText: 'local_notification.foreground.text',
      notificationIcon: const NotificationIconData(
        resType: ResourceType.mipmap,
        resPrefix: ResourcePrefix.ic,
        name: 'launcher',
      ),
    );
  }
}
