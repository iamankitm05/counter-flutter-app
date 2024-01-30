abstract class CounterEvent {
  CounterEvent();
}

class IncreaseCounterEvent extends CounterEvent {
  final int inceraseAmount;

  IncreaseCounterEvent(this.inceraseAmount);
}

class DecreaseCounterEvent extends CounterEvent {
  final int deceraseAmount;

  DecreaseCounterEvent(this.deceraseAmount);
}

class ResetCounterEvent extends CounterEvent {
  ResetCounterEvent();
}
