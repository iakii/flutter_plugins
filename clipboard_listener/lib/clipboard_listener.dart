library clipboard_listener;

import 'src/rust/api/clipboard.dart';
import 'src/rust/frb_generated.dart';
export 'src/rust/api/clipboard.dart' show ClipboardData, DataType, CPImage, greet;

Future<void> clipboardListener(Function(ClipboardData data) callback) async {
  await RustLib.init();
  clipboardListenerStart(dartCallback: (_) {
    final data = getClipboardData();
    callback(data);
    return Future.value('ok');
  });
}
