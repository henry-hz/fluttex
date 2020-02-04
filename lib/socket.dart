import 'dart:async';
import 'dart:math';
import 'package:meta/meta.dart';


@immutable
class Socket {
  final Uri endpoint;
  final List<int> reconnectAfterMs = const [1000, 2000, 5000, 10000];

  Socket(this.endpoint);

}
