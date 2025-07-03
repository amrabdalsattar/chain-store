import 'package:zego_zim/zego_zim.dart';

class ChatService {
  static final ChatService _instance = ChatService._internal();
  static ChatService get instance => _instance;
  ChatService._internal();

  ZIM? _zim;
  String? _currentUserId;
  String? _currentUserName;
  static const int appID = 1760326062; // Your App ID
  static const String appSign =
      '10ca41a0a5b7bafa4e6620f962f23b4486d25257ee58f114031d37bc0ea12a09';

  Future<void> initZIM() async {
    if (_zim != null) return;

    ZIMAppConfig config = ZIMAppConfig();
    config.appID = appID;
    config.appSign = appSign;

    _zim = ZIM.create(config);
  }

  Future<void> login(String userID, String userName) async {
    await initZIM();

    ZIMLoginConfig config = ZIMLoginConfig();
    config.userName = userName;
    config.token =
        ''; // Token can be empty for testing, but should be generated from your server in production
    config.isOfflineLogin = false;

    try {
      await _zim!.login(userID, config);
      _currentUserId = userID;
      _currentUserName = userName;
    } catch (e) {
      throw Exception('Login failed: $e');
    }
  }

  Future<void> logout() async {
    if (_zim != null) {
      await _zim!.logout();
      _currentUserId = null;
      _currentUserName = null;
    }
  }

  Future<void> sendMessage(String targetUserID, String messageText) async {
    if (_zim == null) throw Exception('ZIM not initialized');

    ZIMTextMessage message = ZIMTextMessage(message: messageText);
    ZIMMessageSendConfig config = ZIMMessageSendConfig();

    try {
      await _zim!.sendPeerMessage(message, targetUserID, config);
    } catch (e) {
      throw Exception('Failed to send message: $e');
    }
  }

  Future<List<ZIMMessage>> getMessages(String conversationID) async {
    if (_zim == null) throw Exception('ZIM not initialized');

    ZIMMessageQueryConfig config = ZIMMessageQueryConfig();
    config.count = 50;
    config.reverse = true;

    try {
      ZIMMessageQueriedResult result = await _zim!.queryHistoryMessage(
        conversationID,
        ZIMConversationType.peer,
        config,
      );
      return result.messageList;
    } catch (e) {
      throw Exception('Failed to get messages: $e');
    }
  }

  void setMessageListener(Function(List<ZIMMessage>) onMessageReceived) {
    // Register the message listener
    ZIMEventHandler.onReceivePeerMessage = (
      ZIM zim,
      List<ZIMMessage> messageList,
      String fromUserID,
    ) {
      onMessageReceived(messageList);
    };

    // Also listen for group messages if needed
    ZIMEventHandler.onReceiveGroupMessage = (
      ZIM zim,
      List<ZIMMessage> messageList,
      String fromGroupID,
    ) {
      onMessageReceived(messageList);
    };
  }

  String? get currentUserId => _currentUserId;
  String? get currentUserName => _currentUserName;
}
