import 'device.dart';
import 'adjustable.dart';
import 'battery_powered.dart';

class SmartSpeaker extends Device with BatteryPowered implements Adjustable {
  int volume;

  SmartSpeaker(String name, this.volume) : super(name);

  @override
  void turnOn() {
    print('Speaker $name is ON');
  }

  @override
  void turnOff() {
    print('Speaker $name is OFF');
  }

  @override
  void increase() {
    volume += 5;
    if (volume > 100) {
      volume = 100;
    }
  }

  @override
  void decrease() {
    volume -= 5;
    if (volume < 0) {
      volume = 0;
    }
  }

  @override
  void showInfo() {
    print('Speaker: $name, volume: $volume');
  }
}