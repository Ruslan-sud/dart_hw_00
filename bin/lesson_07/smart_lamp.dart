import 'device.dart';
import 'adjustable.dart';
import 'battery_powered.dart';

class SmartLamp extends Device with BatteryPowered implements Adjustable {
  int brightness;

  SmartLamp(String name, this.brightness) : super(name);

  @override
  void turnOn() {
    print('Lamp $name is ON');
  }

  @override
  void turnOff() {
    print('Lamp $name is OFF');
  }

  @override
  void increase() {
    brightness += 10;
    if (brightness > 100) {
      brightness = 100;
    }
  }

  @override
  void decrease() {
    brightness -= 10;
    if (brightness < 0) {
      brightness = 0;
    }
  }

  @override
  void showInfo() {
    print('Lamp: $name, brightness: $brightness');
  }
}