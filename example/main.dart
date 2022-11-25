/*
 * ping_discover_network_v2
 * Created by Oeng Mengthong
 * 
 * See LICENSE for distribution and usage details.
 */
import 'package:ping_discover_network_v2/ping_discover_network_v2.dart';

/// Discover available network devices in a given subnet on a given port
void main() async {
  // NetworkAnalyzer.discover pings PORT:IP one by one according to timeout.
  // NetworkAnalyzer.discover2 pings all PORT:IP addresses at once.

  const port = 80;
  final stream = NetworkAnalyzer.discover2(
    '192.168.0',
    port,
    timeout: Duration(milliseconds: 5000),
  );

  int found = 0;
  stream.listen((NetworkAddress addr) {
    // print('${addr.ip}:$port');
    if (addr.exists) {
      found++;
      print('Found device: ${addr.ip}:$port');
    }
  }).onDone(() => print('Finish. Found $found device(s)'));
}
