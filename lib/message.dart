import 'dart:convert';
import 'package:meta/meta.dart';

@immutable
class Message {
  final String joinRef, ref, topic, event;
  final Map payload;

  // general constructor
  Message(this.joinRef, this.ref, this.topic, this.event, this.payload);

  // encode this message to JSON
  String toJSON() {
    return json.encode([joinRef, ref, topic, event, payload]);
  }
}

// TODO: create test with this below
void main() {
  // the json should be in the order below to be encoded
  //String j1 = '{"join_ref": 32, "ref": 0, "topic": "my_topic", "event": "my_event", "payload": "some_payload"}';
  //Message m = Message.decode(j1);
  //print(m.event);
}
