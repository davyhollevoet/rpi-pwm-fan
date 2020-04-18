# Raspberry Pi DT Overlay for a PWM-controlled fan

Heavily based on the `pwm-fan.dts` proposed by OP of https://www.raspberrypi.org/forums/viewtopic.php?t=222428
Fixed by borrowing from https://github.com/raspberrypi/linux/raw/rpi-4.19.y/arch/arm/boot/dts/overlays/rpi-poe-overlay.dts

Other pointers:
* https://www.kernel.org/doc/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
* https://www.raspberrypi.org/documentation/configuration/device-tree.md


## Usage
* Make sure you have pwm_fan enabled in your kernel (CONFIG_SENSORS_PWM_FAN=m/y)
* Compile pwm-fan with the `dtc` command in `pwm-fan.dts`
* Add this to `/boot/config.txt`
```
dtoverlay=pwm,pin=12,func=4
dtoverlay=pwm-fan
```

The first overlay enables PWM on pin 12 (change if needed). The second line loads the pwm-fan overlay that defaults to pwm0

## Graph!

Created with `measure.sh` and mad OOo Calc skills

![Temperature without vs with fan under 30s of cpuburn-a53](compare.png?raw=true "Temperature without vs with fan under 30s of cpuburn-a53")

## Todo
* Changing thresholds through /sys/?
* Add moar levels!
* Allow overriding default pwm?
