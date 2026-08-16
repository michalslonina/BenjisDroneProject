# Testing & Validation Checklist

## Pre-Flight Testing (Before First Flight)

Do these tests **indoors** with **NO propellers attached**.

---

## Phase 1: Power-Up Tests

### Test 1.1: Power Distribution
- [ ] Connect battery (propellers OFF)
- [ ] Flight Controller LED lights
- [ ] ESCs beep (initialization tone)
- [ ] No smoke or burning smell
- [ ] **Disconnect battery**

### Test 1.2: Voltage Check
- [ ] Measure battery voltage: _____ V (should be ~12.6V for 3S)
- [ ] Measure 5V BEC output: _____ V (should be ~5.0V)
- [ ] Measure FC 5V rail: _____ V (should be ~5.0V)
- [ ] **No short circuits found**

---

## Phase 2: Motor Tests

### Test 2.1: Motor Spin Check
- [ ] Connect battery (propellers OFF)
- [ ] Use Betaflight Configurator (on a PC)
- [ ] Go to "Motors" tab
- [ ] Send 10% throttle command
- [ ] All 4 motors spin slowly
- [ ] **Note:** Motor 1 (FL) spins _____ (CW/CCW)
- [ ] **Note:** Motor 2 (FR) spins _____ (CW/CCW)
- [ ] **Note:** Motor 3 (RR) spins _____ (CW/CCW)
- [ ] **Note:** Motor 4 (RL) spins _____ (CW/CCW)
- [ ] **Disconnect battery**

### Test 2.2: Motor Spin Direction Verification
- [ ] For stable flight, we need **opposite motors to spin same direction**
  - Motors 1&3 (diagonal): Should spin clockwise
  - Motors 2&4 (diagonal): Should spin counter-clockwise
- [ ] If any motor direction is wrong:
  - Option 1: Swap 2 of the 3 motor wires (reverses spin direction)
  - Option 2: Swap leads in Betaflight (software reverse)

**Result:**
- [ ] Motors 1 & 3: CW ✓
- [ ] Motors 2 & 4: CCW ✓

---

## Phase 3: Gyro & Accelerometer Tests

### Test 3.1: Gyro Responsiveness
- [ ] Connect FC to Betaflight Configurator
- [ ] Go to "Receiver" tab
- [ ] Move drone forward/back/left/right
- [ ] Watch "Roll" and "Pitch" values change
- [ ] Values should be **smooth** (not jerky)
- [ ] **Disconnect**

### Test 3.2: Gyro Orientation
- [ ] Gyro should understand drone's orientation:
  - Push nose down → Pitch goes negative
  - Roll right → Roll value goes positive
- [ ] If reversed, check FC orientation in Betaflight settings

**Result:**
- [ ] Gyro responds correctly ✓

---

## Phase 4: Radio Link Tests

### Test 4.1: Ground Station Setup
- [ ] Plug Xbox controller into computer (or ground station ESP32 TX)
- [ ] Open serial monitor (115,200 baud)
- [ ] Read Xbox sticks:
  - Left stick vertical: _____ (0-255)
  - Right stick vertical: _____ (0-255)
- [ ] Move sticks, values should change
- [ ] **Test passes if all sticks work**

### Test 4.2: Wireless Link
- [ ] Power up drone (battery connected, ESP32 RX on)
- [ ] Watch serial monitor for:
  - "Radio: OK" message OR
  - LED blinks fast (signal good) OR
  - "Received: [values]" message
- [ ] Move Xbox sticks
- [ ] FC should show stick movement in Betaflight
- [ ] **Disconnect everything**

### Test 4.3: Failsafe Test
- [ ] Power up drone (propellers OFF)
- [ ] Confirm radio signal good (LED fast blink)
- [ ] Disconnect transmitter (turn off, or move out of range)
- [ ] FC LED should change to slow blink
- [ ] After 1 second, motors should stop (failsafe triggered)
- [ ] Reconnect transmitter
- [ ] Signal should restore immediately
- [ ] **Test passes if failsafe works**

---

## Phase 5: Control Input Tests

### Test 5.1: Stick Mapping
- [ ] In Betaflight Configurator, go to "Receiver" tab
- [ ] Center all sticks (should read ~1500)
- [ ] Push throttle to max → Should read ~2000
- [ ] Push throttle to min → Should read ~1000
- [ ] Repeat for pitch, roll, yaw

**Mapping should be:**
| Stick | Min | Center | Max | Expected Range |
|------|-----|--------|-----|-----------------|
| Throttle | _____ | _____ | _____ | 1000-2000 |
| Pitch | _____ | _____ | _____ | 1000-2000 |
| Roll | _____ | _____ | _____ | 1000-2000 |
| Yaw | _____ | _____ | _____ | 1000-2000 |

- [ ] All ranges correct
- [ ] **If not, reverse stick in firmware or Betaflight**

---

## Phase 6: Pre-Flight Physical Checks

### Test 6.1: Mechanical Integrity
- [ ] Frame is not cracked
- [ ] All arms are firmly attached
- [ ] Motors are secure (not loose)
- [ ] Wires are not pinched or damaged
- [ ] Battery is secure (not falling out)

### Test 6.2: Weight Distribution
- [ ] Drone should balance roughly in center
- [ ] Pick up drone gently (battery connected)
- [ ] It should feel fairly centered
- [ ] If lopsided, move battery or components

### Test 6.3: Propeller Check (CRITICAL)
- [ ] Propellers NOT attached yet
- [ ] Verify propeller sizes: _____ inches
- [ ] Check rotation direction:
  - Front motors (1&2) should have different prop types (CW vs CCW)
  - Rear motors (3&4) should have matching pairs

---

## Phase 7: First Flight Preparations

### Test 7.1: Betaflight Configuration
- [ ] Download Betaflight Configurator (Windows/Mac/Linux)
- [ ] Connect FC to PC via USB
- [ ] Check "Gyro" tab:
  - Gyro detected ✓
  - Accelerometer detected ✓
- [ ] Check "Motors" tab:
  - Correct motor numbering (1/2/3/4)
  - Spin test passes (no propellers!)
- [ ] Check "Receiver" tab:
  - Sticks reading correctly
  - No glitches or dropouts
- [ ] **Save configuration**

### Test 7.2: Flight Mode Setup
- [ ] For first flight: **Use Angle Mode (beginner-friendly)**
- [ ] Angle Mode provides auto-leveling (drone rights itself)
- [ ] Acro Mode is for advanced flyers
- [ ] Configure in Betaflight "Modes" tab

### Test 7.3: PID Tuning (Can Tune Later)
- [ ] Default PIDs usually work fine for beginners
- [ ] Can adjust later if drone is twitchy or slow to respond
- [ ] For now, use stock settings

---

## First Flight Checklist

**Do this 5 minutes before flying:**

- [ ] Battery fully charged
- [ ] Propellers properly installed (CW and CCW pairs)
- [ ] Propellers tight (not loose, but not over-tightened)
- [ ] All electronics armed and ready
- [ ] TX radio signal strong ("Radio: OK" message)
- [ ] Flying space is clear of people/animals/obstacles
- [ ] Wearing goggles (phone with FPV app running)
- [ ] Camera and VTx powered (check LED indicator)
- [ ] Beginner flight mode enabled (Angle Mode)
- [ ] Benjamin is ready to fly! 🚁

---

## First Flight Procedure

### Startup
1. Power on Ground Station (ESP32 TX)
2. Power on Drone (battery last)
3. Wait 3 seconds (self-test)
4. Listen for beep (armed)
5. Check "Ready to fly" on serial monitor

### Liftoff
1. Start with low throttle (10%)
2. Increase slowly until drone lifts
3. Keep height low (~1 meter)
4. Practice hover
5. Test stick response (slow gentle movements)

### Recovery
1. If unstable: **Push throttle down immediately**
2. Drone will land
3. **Stay safe:** Never fly toward people

### Landing
1. Reduce throttle to zero
2. Let drone settle gently
3. Power off battery
4. **Propellers stop**
5. You can approach safely

---

## Post-Flight Inspection

After each flight:

- [ ] Check battery voltage (should be ~9.6V minimum for 3S)
- [ ] Inspect propellers for cracks
- [ ] Check frame for damage
- [ ] Feel motors (should be warm, not hot)
- [ ] Listen for any weird sounds
- [ ] Check all connections are still tight
- [ ] **Ready for next flight!**

---

## Troubleshooting First Flight

### Problem: Drone doesn't lift off
**Solutions:**
- Check battery voltage (below 10V = too low)
- Check motor direction (should all spin correctly)
- Verify ESC calibration (sometimes needed)

### Problem: Drone tilts to one side
**Solutions:**
- This is normal initially
- Use Betaflight to check gyro/accelerometer
- May need gyro trim adjustment
- Or motor direction might be wrong

### Problem: Slow/sluggish response
**Solutions:**
- Could be low battery
- Could be weak radio signal
- Could be PIDs not tuned (normal)

### Problem: Propeller flies off
**Solutions:**
- Propeller hubs weren't tight
- Tighten before next flight
- Check for damage

### Problem: Lost radio signal / failsafe
**Solutions:**
- Drone should cut throttle (failsafe works!)
- Increases TX power in firmware
- Verify antenna position (should be straight)
- Check for interference (WiFi, other devices)

---

## Maintenance Log

Keep a log of every flight:

| Date | Flight Time | Notes | Battery V | Issues |
|------|-------------|-------|-----------|--------|
| | | | | |
| | | | | |
| | | | | |

