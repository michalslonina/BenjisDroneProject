# Assembly Guide

## Overview

This guide describes how to assemble all the electronics into your 3D-printed frame.

**Timeline:** 6-8 hours over 2-3 sessions  
**Tools needed:** Soldering iron, solder, multimeter, small screwdrivers, hot glue gun, super glue

---

## Pre-Assembly Checklist

Before you start, verify you have everything:

### Electronics
- [ ] 1x Flight Controller (with gyro/accelerometer)
- [ ] 4x ESCs (20A, with BEC)
- [ ] 4x Brushless motors (2300 KV)
- [ ] 4x Propellers (5")
- [ ] 1x 3S LiPo battery
- [ ] 1x Charger
- [ ] 2x ESP32 boards
- [ ] 2x nRF24L01 modules
- [ ] 1x Logic level converter
- [ ] Connectors (XT30, servo leads, JST)
- [ ] Wire (22 AWG for power, servo wire for signals)

### Mechanical
- [ ] 3D printed frame parts (all cleaned/sanded)
- [ ] Propeller adaptors for motor shafts
- [ ] Servo extension cables or pre-made connectors

### Tools
- [ ] Soldering iron (30-40W minimum)
- [ ] Solder (lead-free or lead-based)
- [ ] Helping hands (third-hand tool)
- [ ] Flush cutters
- [ ] Multimeter
- [ ] Small screwdrivers (0.5mm, 1.5mm, 2.5mm)
- [ ] Hot glue gun
- [ ] Super glue (cyanoacrylate)

---

## Step 1: Motor-to-ESC Soldering

**Time:** 30-45 minutes  
**Difficulty:** Medium (first soldering task)

### What You're Doing
Connecting each motor's 3 power wires to its ESC's 3 power terminals.

### Steps

1. **Prepare motor wires**
   - Strip ~5mm from each of the 3 motor wires
   - Tin each wire (pre-solder to make connection easier)
   - Set motors aside

2. **Prepare ESC pads**
   - Locate the 3 power output pads on each ESC
   - They're labeled or clearly marked
   - Tin each pad with a small amount of solder

3. **Solder connections** (for each of 4 motors)
   - **Use helping hands to hold motor/ESC**
   - Touch iron to pad, then touch wire
   - Heat both for 1-2 seconds
   - Add solder (should flow smoothly)
   - Remove iron and wire, let cool
   - Check connection (no cold solder joints)

4. **Check polarity** (Important!)
   - Motor direction can be reversed
   - We'll test and fix in Betaflight if needed
   - For now, just make sure connections are solid

### Common Issues

**Cold solder joint:** Looks dull gray, not shiny  
→ Reheat and add more solder

**Wire burns:** Solder too hot, takes too long  
→ Use 30W iron, move faster

**Pads lifting:** Rare on ESCs, but use less heat

---

## Step 2: ESC-to-Flight Controller Wiring

**Time:** 20-30 minutes  
**Difficulty:** Low (soldering or connectors)

### What You're Doing
Connecting ESCs to the flight controller so it can tell them how fast to spin.

### Option A: Soldering (More Reliable)

1. **Solder 4 wires to FC**
   - Use servo connector wires
   - Tin the FC signal pads first
   - Solder wires to FC pads labeled:
     - Motor 1, Motor 2, Motor 3, Motor 4
   - Don't solder power here (we'll use BEC)

2. **Connect to ESCs**
   - Solder wire to ESC signal pad
   - One wire per ESC signal pad
   - Label wires: 1, 2, 3, 4 with tape

### Option B: Connectors (Easier, Reversible)

1. **Use pre-made servo connectors**
   - ESCs come with signal connectors
   - Connect to FC signal pins (labeled Motor 1-4)
   - Much easier, can swap if needed

### Important: Motor Numbering

```
      1    2
        \/
        /\
      4    3

Motor 1: Front-left
Motor 2: Front-right
Motor 3: Rear-right
Motor 4: Rear-left
```

---

## Step 3: Power Distribution

**Time:** 20 minutes  
**Difficulty:** Medium (working with main power)

### What You're Doing
Connecting the battery and ESCs so power flows properly.

### Steps

1. **Battery connector**
   - Solder XT30 connector to battery (positive+/negative-)
   - Use 16 AWG or thicker wire
   - **Be very careful with polarity!**
   - Red = Positive, Black = Negative

2. **ESC Power (BEC)**
   - Most ESCs have a built-in BEC (Battery Elimination Circuit)
   - The BEC converts battery voltage to 5V for FC
   - Wire all 4 ESCs in parallel:
     - Positive from battery → all ESC + pads
     - Negative from battery → all ESC - pads

3. **Flight Controller Power**
   - Connect FC power to one of the ESC BEC outputs
   - Or connect directly to battery (if FC has power input)
   - 5V should appear when battery is plugged in
   - **Don't plug battery in yet for testing!**

### Power Flow Diagram

```
Battery (12.6V) 
    ↓
    ├─→ ESC 1 (motor power)
    ├─→ ESC 2 (motor power)
    ├─→ ESC 3 (motor power)
    ├─→ ESC 4 (motor power)
    │
    ├─→ BEC (5V regulator inside ESC)
    │   ↓
    └─→ Flight Controller (5V logic)
```

---

## Step 4: Ground Station Electronics (ESP32 TX)

**Time:** 15 minutes  
**Difficulty:** Low (USB connection, no soldering)

### What You're Doing
Setting up the transmitter board on the ground station.

### Steps

1. **Mount ESP32 TX**
   - Doesn't matter where (ground station, you're holding it)
   - Could be in a small 3D-printed case or on a breadboard

2. **Connect nRF24L01**
   - nRF24L01 has 8 pins
   - Connect to ESP32 SPI pins:
     ```
     nRF24L01 → ESP32
     GND → GND
     VCC → 3.3V
     CE → GPIO4 (or any GPIO)
     CSN → GPIO5 (or any GPIO)
     SCK → GPIO18 (SPI clock)
     MOSI → GPIO23 (SPI data out)
     MISO → GPIO19 (SPI data in)
     IRQ → GPIO2 (optional, for interrupts)
     ```
   - Can solder or use breadboard with jumpers

3. **Connect Xbox Controller**
   - Plug into ESP32 via USB cable
   - Should enumerate as a USB HID device

---

## Step 5: Receiver Electronics (ESP32 RX on Drone)

**Time:** 15-20 minutes  
**Difficulty:** Medium (soldering to FC)

### What You're Doing
Setting up the receiver board on the drone.

### Steps

1. **Mount ESP32 RX on frame**
   - Use hot glue or foam tape
   - Keep away from motors (electromagnetic noise)
   - Keep away from battery (vibration)
   - Near flight controller is good

2. **Connect nRF24L01**
   - Same as ESP32 TX above
   - Use flexible servo wires or jumpers
   - Can mount separately with foam tape

3. **Connect to Flight Controller**
   - **ESP32 sends SBUS signal to FC**
   - SBUS goes to one UART RX pin on FC
   - Use logic level converter (3.3V → 5V)
   - Connections:
     ```
     ESP32 → Logic Level Converter → Flight Controller
     GPIO17 (TX) → High side IN → FC UART RX
     GND → GND
     ```

4. **Power ESP32 from BEC**
   - Connect 5V from ESC BEC
   - Doesn't need much current (~200mA max)

---

## Step 6: FPV System

**Time:** 10-15 minutes  
**Difficulty:** Low (mostly just mounting)

### What You're Doing
Installing camera and video transmitter.

### Steps

1. **Mount FPV Camera**
   - Use 3D-printed camera mount
   - Point forward (drone's flying direction)
   - Secure with hot glue or velcro
   - Cable should go toward back of drone

2. **Connect Camera Cable**
   - Video out from camera → Video in on VTx
   - Use short video cables (less interference)

3. **Mount VTx**
   - Use foam tape (vibration isolation)
   - Antenna pointing down/back (not coiled)
   - Mount near camera for short cable run

4. **Power VTx**
   - Connect to 5V from BEC (or battery with voltage regulator)
   - **Check polarity!** Most VTx have red/black wires

---

## Step 7: Battery Connection

**Time:** 5 minutes  
**Difficulty:** Low (but important!)

### What You're Doing
Connecting the main battery (last step, do this last!).

### Steps

1. **Final visual inspection**
   - Check all solder joints are clean
   - Check no loose wires touching propellers
   - Check motor direction (we'll verify in software)

2. **Mount battery**
   - Use velcro strap on bottom of frame
   - Easy to remove for charging

3. **Plug in battery (carefully!)**
   - If everything is correct, FC LED should light
   - **Do NOT attach propellers yet!**
   - Motors should NOT spin (idle)

---

## Step 8: Mechanical Assembly

**Time:** 30-45 minutes  
**Difficulty:** Low (just bolting things together)

### What You're Doing
Assembling the 3D-printed frame.

### Steps

1. **Glue arms to chassis**
   - Use super glue or epoxy
   - Let cure per instructions (usually 24h)
   - Can use hot glue for quick test, switch later

2. **Attach motors to arms**
   - Motors usually bolt to arms
   - Use 3mm or 2mm bolts
   - Ensure motor shafts point up

3. **Attach propeller adaptors**
   - Small propeller hub goes on motor shaft
   - Secure with lock washer + nut
   - Don't over-tighten (strip threads easily)

4. **Route wires**
   - Keep signal wires away from power wires
   - Use zip ties to bundle
   - Don't pinch wires

5. **Mount all electronics**
   - FC in center
   - ESCs near motors (attached to arms)
   - Camera pointing forward
   - Battery underneath

---

## Final Checks Before First Power-On

**Go through this checklist:**

- [ ] All solder joints are solid (no cold joints)
- [ ] No bare wires touching (short circuit risk)
- [ ] Battery is charged
- [ ] Propellers are NOT attached
- [ ] FC LED lights when battery connected
- [ ] No smoke or burning smell
- [ ] All motors spin freely by hand
- [ ] All connections are labeled correctly
- [ ] Ground station (ESP32 TX) is ready with charged Xbox controller

---

## Troubleshooting

### FC won't power on
- Check battery voltage with multimeter
- Check XT30 connector polarity
- Check BEC connection (should be red/black)

### One motor doesn't spin
- Check solder joints (motor-ESC)
- Check signal wire (ESC-FC)
- Try swapping ESC with known good one

### Radio signals don't work
- Check nRF24L01 power (3.3V)
- Check SPI wires (SCK, MOSI, MISO)
- Check CE/CSN pins

### Nothing works
- Multimeter check every connection
- Ask Dad for help!
- Start with just FC + battery, then add pieces one by one

