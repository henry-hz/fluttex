import 'package:statemachine/statemachine.dart';
import 'package:meta/meta.dart';
import 'dart:async';

// we will have our channel push and join with the following erros:
// 1. ok,  2. error, 3. timeout  [see js code]

main() {
  Channel c = Channel();
  c.closed.onEntry(() => print("enter closed"));
  c.joining.onEntry(() => print("enter joiining"));
  c.leaving.onEntry(() => print("entering leaving"));
  c.joining.onTimeout(Duration(seconds: 3), () => c.leaving.enter());
  c.joining.enter();
  Future.delayed(Duration(seconds: 5), () => print("last"));
  //c.closed.enter();
}


@immutable
class Channel {
  // state machine for this channel object
  static final machine = Machine();
  // all the possible states
  final State closed = machine.newState("closed");
  final State errored = machine.newState("errored");
  final State joined  = machine.newState("joined");
  final State joining = machine.newState("joining");
  final State leaving = machine.newState("leaving");
  //
  Channel() {
    closed.onEntry(() => print("enter closed"));
    machine.start();
  }
  // red.onEntry(() => output('${ansiRed}RED   '));
  // red.onStream(input, keyboardDispatcher(yellowToGreen));
  // red.onTimeout(const Duration(seconds: 20), yellowToGreen.enter);

}
