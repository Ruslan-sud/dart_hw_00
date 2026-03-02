import 'device.dart';
import 'adjustable.dart';
import 'battery_powered.dart';

import 'smart_lamp.dart';
import 'smart_speaker.dart';
import 'smart_thermostat.dart';

void main() {
  List<Device> devices = [
    SmartLamp('Living room lamp', 50),
    SmartSpeaker('Kitchen speaker', 30),
    SmartThermostat('Main thermostat', 22),
  ];

  for (var device in devices) {
  device.showInfo();
  device.turnOn();

  if (device is Adjustable) {
    final adjustable = device as Adjustable;
    adjustable.increase();
  }

  if (device is BatteryPowered) {
    final batteryDevice = device as BatteryPowered;
    batteryDevice.showBattery();
  }

  print('---------------------------------------');
}

  print('All devices processed.');
}