# Welcome Benjamin! Your FPV Drone Project Guide

Hi Benjamin! 👋 This is YOUR drone project. You're going to build and control a drone that flies and lets you see what it sees!

## What Does Each Part Do?

### The Controller (Xbox Controller)
This is how you **tell the drone what to do**. When you push the sticks:
- **Left stick up/down** = Throttle (how fast the motors spin)
- **Left stick left/right** = Rotation (makes drone spin)
- **Right stick up/down** = Pitch (drone goes forward/backward)
- **Right stick left/right** = Roll (drone goes left/right)

### The Radio Transmitter (ESP32 TX)
This is like a **magic messenger**. It takes your controller inputs and sends them through the air to the drone using invisible radio waves. It's the same type of radio waves your WiFi uses!

### The Drone Receiver (ESP32 RX)
This is the **magic messenger on the drone**. It catches the radio signal from the transmitter and tells the flight controller what to do.

### The Flight Controller (FC)
This is the **drone's brain**. It reads your commands and figures out how fast each motor should spin to:
- Keep the drone balanced
- Fly forward/backward
- Turn left/right
- Go up/down

It does this **hundreds of times per second**!

### The Motors
These are the **drone's muscles**. The flight controller tells each one how fast to spin. Four motors spinning at different speeds = drone moves!

### The Camera & Video Transmitter (VTx)
The camera is the **drone's eyes**. The VTx is the **radio broadcaster**. They work together to send video to your phone so you can see what the drone sees while flying!

## How It All Works Together

```
You push sticks on Xbox
           ↓
ESP32 TX gets the signal
           ↓
Sends radio signal to drone
           ↓
ESP32 RX on drone receives it
           ↓
Flight Controller reads commands
           ↓
Flight Controller tells motors how fast to spin
           ↓
Motors spin → Drone flies!
           ↓
Camera sees everything
           ↓
VTx sends video to your phone
           ↓
You see FPV (First Person View)!
```

## Your Jobs (With Dad's Help)

1. **Learn about each part** — Know what it does
2. **Help assemble** — Put pieces together (mechanical)
3. **Write the firmware** — Tell the ESP32 RX what to do (coding!)
4. **Test and fly** — Make sure everything works

## Safety Rules

⚠️ **BEFORE EVERY FLIGHT:**
- Check that all propellers are tight
- Make sure battery is connected
- Check radio signal is good
- Keep people and pets away from propellers
- Never point drone at faces

⚠️ **IF YOU LOSE CONTROL:**
- Let go of sticks (motors stop)
- The drone will turn off motors to be safe

## Cool Things You'll Learn

✅ Radio signals and wireless communication  
✅ How drones stay balanced (gyros and sensors)  
✅ Embedded systems and microcontrollers  
✅ C/C++ programming  
✅ Soldering and electronics assembly  
✅ Problem-solving when things don't work  
✅ How to fly!  

## Let's Get Started! 🚀

First step: **Gather all the parts** from the BOM (Bill of Materials).

Next: **Learn how each part works** by reading the part datasheets with Dad.

Then: **Start building!**

Good luck! 🎮🚁
