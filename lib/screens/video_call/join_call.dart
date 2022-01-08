import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:agora_rtc_engine/rtc_engine.dart';
import 'package:agora_rtc_engine/rtc_local_view.dart' as RtcLocalView;
import 'package:agora_rtc_engine/rtc_remote_view.dart' as RtcRemoteView;
import 'package:shrink/variables/globalVar.dart';

class JoinCall extends StatefulWidget {
  // const JoinCall({ Key? key }) : super(key: key);

  @override
  _JoinCallState createState() => _JoinCallState();
}

const agoraToken =
    "006cc294975e49c4184998d7aac92b30ea4IAAD3hTa/rL5Bf6fqgjsvO3+d7CVDpxJdhZGIOBk9PH/0kVE42sAAAAAEADSvifOruNZYQEAAQCt41lh";
const appID = "cc294975e49c4184998d7aac92b30ea4";

class _JoinCallState extends State<JoinCall> {
  int _remoteUid;
  RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  bool localJoinSuccess = false;
  bool audioEnabled = true;
  bool videoEnabled = true;

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = await RtcEngine.create(appID);
    await _engine.enableVideo();
    _engine.setEventHandler(
      RtcEngineEventHandler(
        joinChannelSuccess: (String channel, int uid, int elapsed) {
          print("local user $uid joined");
          setState(() {
            localJoinSuccess = true;
          });
        },
        userJoined: (int uid, int elapsed) {
          print("remote user $uid joined");
          setState(() {
            _remoteUid = uid;
          });
        },
        userOffline: (int uid, UserOfflineReason reason) {
          print("remote user $uid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
      ),
    );

    await _engine.joinChannel(agoraToken, "new", null, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: _remoteVideo(),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                height: ScreenSize.height * 0.2,
                width: ScreenSize.width * 0.3,
                child: Center(
                  child: _renderLocalPreview(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    audioEnabled == true
                        ? IconButton(
                            onPressed: () {
                              _engine.muteLocalAudioStream(true);
                              setState(() {
                                audioEnabled = false;
                              });
                            },
                            icon: Icon(
                              Icons.mic_rounded,
                              size: ScreenSize.height * 0.037,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              _engine.muteLocalAudioStream(false);
                              setState(() {
                                audioEnabled = true;
                              });
                            },
                            icon: Icon(
                              Icons.mic_off_rounded,
                              size: ScreenSize.height * 0.037,
                              color: Colors.red,
                            ),
                          ),
                    SizedBox(
                      width: ScreenSize.width * 0.05,
                    ),
                    IconButton(
                      onPressed: () {
                        _engine.destroy();

                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.call_end_rounded,
                        size: ScreenSize.height * 0.045,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.width * 0.05,
                    ),
                    videoEnabled == true
                        ? IconButton(
                            onPressed: () {
                              _engine.muteLocalVideoStream(true);
                              setState(() {
                                videoEnabled = false;
                              });
                            },
                            icon: Icon(
                              Icons.videocam_rounded,
                              size: ScreenSize.height * 0.037,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              _engine.muteLocalVideoStream(false);

                              setState(() {
                                videoEnabled = true;
                              });
                            },
                            icon: Icon(
                              Icons.videocam_off_rounded,
                              size: ScreenSize.height * 0.037,
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return RtcRemoteView.SurfaceView(uid: _remoteUid);
    } else {
      return Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }

  Widget _renderLocalPreview() {
    if (localJoinSuccess == true) {
      return RtcLocalView.SurfaceView();
    } else {
      return Text(
        'Joining Channel, Please wait.....',
        textAlign: TextAlign.center,
      );
    }
  }
}
