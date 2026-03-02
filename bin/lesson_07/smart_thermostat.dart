import 'device.dart';

class SmartThermostat extends Device {
  int temperature;

  SmartThermostat(String name, this.temperature) : super(name);

  @override
  void turnOn() {
    print('Thermostat $name is ON');
  }

  @override
  void turnOff() {
    print('Thermostat $name is OFF');
  }

  @override
  void showInfo() {
    print('Thermostat: $name, temperature: $temperature');
  }
}