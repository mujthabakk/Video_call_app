// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_call_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoCallStore on _VideoCallStore, Store {
  late final _$isEngineInitializedAtom =
      Atom(name: '_VideoCallStore.isEngineInitialized', context: context);

  @override
  bool get isEngineInitialized {
    _$isEngineInitializedAtom.reportRead();
    return super.isEngineInitialized;
  }

  @override
  set isEngineInitialized(bool value) {
    _$isEngineInitializedAtom.reportWrite(value, super.isEngineInitialized, () {
      super.isEngineInitialized = value;
    });
  }

  late final _$channelNameAtom =
      Atom(name: '_VideoCallStore.channelName', context: context);

  @override
  String get channelName {
    _$channelNameAtom.reportRead();
    return super.channelName;
  }

  @override
  set channelName(String value) {
    _$channelNameAtom.reportWrite(value, super.channelName, () {
      super.channelName = value;
    });
  }

  late final _$isCustomChannelAtom =
      Atom(name: '_VideoCallStore.isCustomChannel', context: context);

  @override
  bool get isCustomChannel {
    _$isCustomChannelAtom.reportRead();
    return super.isCustomChannel;
  }

  @override
  set isCustomChannel(bool value) {
    _$isCustomChannelAtom.reportWrite(value, super.isCustomChannel, () {
      super.isCustomChannel = value;
    });
  }

  late final _$localUserJoinedAtom =
      Atom(name: '_VideoCallStore.localUserJoined', context: context);

  @override
  bool get localUserJoined {
    _$localUserJoinedAtom.reportRead();
    return super.localUserJoined;
  }

  @override
  set localUserJoined(bool value) {
    _$localUserJoinedAtom.reportWrite(value, super.localUserJoined, () {
      super.localUserJoined = value;
    });
  }

  late final _$remoteUidAtom =
      Atom(name: '_VideoCallStore.remoteUid', context: context);

  @override
  int? get remoteUid {
    _$remoteUidAtom.reportRead();
    return super.remoteUid;
  }

  @override
  set remoteUid(int? value) {
    _$remoteUidAtom.reportWrite(value, super.remoteUid, () {
      super.remoteUid = value;
    });
  }

  late final _$isMutedAtom =
      Atom(name: '_VideoCallStore.isMuted', context: context);

  @override
  bool get isMuted {
    _$isMutedAtom.reportRead();
    return super.isMuted;
  }

  @override
  set isMuted(bool value) {
    _$isMutedAtom.reportWrite(value, super.isMuted, () {
      super.isMuted = value;
    });
  }

  late final _$isVideoMutedAtom =
      Atom(name: '_VideoCallStore.isVideoMuted', context: context);

  @override
  bool get isVideoMuted {
    _$isVideoMutedAtom.reportRead();
    return super.isVideoMuted;
  }

  @override
  set isVideoMuted(bool value) {
    _$isVideoMutedAtom.reportWrite(value, super.isVideoMuted, () {
      super.isVideoMuted = value;
    });
  }

  late final _$handlePermissionsAsyncAction =
      AsyncAction('_VideoCallStore.handlePermissions', context: context);

  @override
  Future<void> handlePermissions() {
    return _$handlePermissionsAsyncAction.run(() => super.handlePermissions());
  }

  late final _$initAgoraAsyncAction =
      AsyncAction('_VideoCallStore.initAgora', context: context);

  @override
  Future<void> initAgora(String channelName) {
    return _$initAgoraAsyncAction.run(() => super.initAgora(channelName));
  }

  late final _$_VideoCallStoreActionController =
      ActionController(name: '_VideoCallStore', context: context);

  @override
  void generateRandomChannel() {
    final _$actionInfo = _$_VideoCallStoreActionController.startAction(
        name: '_VideoCallStore.generateRandomChannel');
    try {
      return super.generateRandomChannel();
    } finally {
      _$_VideoCallStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChannelName(String value) {
    final _$actionInfo = _$_VideoCallStoreActionController.startAction(
        name: '_VideoCallStore.setChannelName');
    try {
      return super.setChannelName(value);
    } finally {
      _$_VideoCallStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleMute() {
    final _$actionInfo = _$_VideoCallStoreActionController.startAction(
        name: '_VideoCallStore.toggleMute');
    try {
      return super.toggleMute();
    } finally {
      _$_VideoCallStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleVideo() {
    final _$actionInfo = _$_VideoCallStoreActionController.startAction(
        name: '_VideoCallStore.toggleVideo');
    try {
      return super.toggleVideo();
    } finally {
      _$_VideoCallStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void switchCamera() {
    final _$actionInfo = _$_VideoCallStoreActionController.startAction(
        name: '_VideoCallStore.switchCamera');
    try {
      return super.switchCamera();
    } finally {
      _$_VideoCallStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disposeEngine() {
    final _$actionInfo = _$_VideoCallStoreActionController.startAction(
        name: '_VideoCallStore.disposeEngine');
    try {
      return super.disposeEngine();
    } finally {
      _$_VideoCallStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEngineInitialized: ${isEngineInitialized},
channelName: ${channelName},
isCustomChannel: ${isCustomChannel},
localUserJoined: ${localUserJoined},
remoteUid: ${remoteUid},
isMuted: ${isMuted},
isVideoMuted: ${isVideoMuted}
    ''';
  }
}
