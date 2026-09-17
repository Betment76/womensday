import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_rustore_update/flutter_rustore_update.dart';

/// RuStore In-app Updates: отложенное обновление без своего UI.
class RustoreUpdateService {
  bool _isStarted = false;
  bool _isCompleting = false;
  StreamSubscription<RequestResponse>? _stateSubscription;

  Future<void> executeCheckAndApply() async {
    if (_isStarted || !Platform.isAndroid) {
      return;
    }
    _isStarted = true;
    try {
      final UpdateInfo info = await RustoreUpdateClient.info();
      await _executeApplyInfo(info);
    } catch (error) {
      if (kDebugMode) {
        debugPrint('[RuStoreUpdate] info: $error');
      }
    }
  }

  Future<void> _executeApplyInfo(UpdateInfo info) async {
    final UpdateAvailability availability = info.updateAvailabilityValue;
    if (availability == UpdateAvailability.available &&
        info.installStatusValue == InstallStatus.downloaded) {
      await _executeCompleteFlexible();
      return;
    }
    if (availability == UpdateAvailability.available) {
      _executeListenState();
      await _executeStartDownload();
      return;
    }
    if (availability == UpdateAvailability.inProgress) {
      _executeListenState();
    }
  }

  void _executeListenState() {
    _stateSubscription ??= RustoreUpdateClient.stateStream.listen(
      (RequestResponse state) {
        switch (state.installStatusValue) {
          case InstallStatus.downloaded:
            unawaited(_executeCompleteFlexible());
          case InstallStatus.failed:
            _executeStopListening();
            if (kDebugMode) {
              debugPrint(
                '[RuStoreUpdate] failed: ${state.installError.description}',
              );
            }
          default:
            break;
        }
      },
      onError: (Object error) {
        _executeStopListening();
        if (kDebugMode) {
          debugPrint('[RuStoreUpdate] state: $error');
        }
      },
    );
  }

  Future<void> _executeStartDownload() async {
    try {
      final DownloadResponse response = await RustoreUpdateClient.download();
      if (response.code == ACTIVITY_RESULT_CANCELED) {
        _executeStopListening();
      }
    } catch (error) {
      _executeStopListening();
      if (kDebugMode) {
        debugPrint('[RuStoreUpdate] download: $error');
      }
    }
  }

  Future<void> _executeCompleteFlexible() async {
    if (_isCompleting) {
      return;
    }
    _isCompleting = true;
    _executeStopListening();
    try {
      await RustoreUpdateClient.completeUpdateFlexible();
    } catch (error) {
      _isCompleting = false;
      if (kDebugMode) {
        debugPrint('[RuStoreUpdate] complete: $error');
      }
    }
  }

  void _executeStopListening() {
    unawaited(_stateSubscription?.cancel());
    _stateSubscription = null;
  }
}
