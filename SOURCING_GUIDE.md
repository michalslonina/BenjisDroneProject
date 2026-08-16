# Component Sourcing Guide

## Strategy

**Goal:** Get all parts within 2-4 weeks, minimize cost

**Three-tier approach:**
1. **AliExpress** — Cheapest, but slowest (20-40 days)
2. **EU hobby shops** — Medium price, medium speed (5-10 days)
3. **Local shops** — Most expensive, fastest (same day if in stock)

## Order Now (AliExpress - 30+ day wait)

**Start these orders FIRST** — they take the longest:

### RF Modules & Wireless
- nRF24L01+ module (2x)
  - Search: "nRF24L01 2.4GHz wireless module"
  - Price: €2-3 each
  - Verify: Comes with antenna, has "3.3V" marked

- Logic Level Converter (1x)
  - Search: "4-channel bidirectional logic level converter"
  - Price: €2-3
  - Use for: Converting 3.3V ESP32 → 5V Flight Controller

### Motors
- A2212 2300 KV brushless motor (4x)
  - Search: "A2212 1000KV brushless outrunner motor"
  - Actually look for 2300 KV variants
  - Price: €4-6 each
  - Check: Reviews for reliability

- Alternative (if A2212 unavailable):
  - Search: "2312 brushless motor 1900 KV"
  - Similar specs, same application

### ESCs
- 20A Electronic Speed Controller (4x)
  - Search: "20A ESC brushless OPTO"
  - Price: €2-3 each
  - Important: Look for ones that say "Betaflight compatible"

### Connectors & Wiring
- XT30 connectors (set of 10+)
- JST connectors (assorted)
- Servo extension cables (4x)
- Shrink tube assortment
- **Search bundle:** "FPV drone connector kit"
- Total: €8-12 for all

### Flight Controller
- Omnibus F4 or similar Betaflight-compatible FC
  - Search: "Omnibus F4 flight controller"
  - Price: €12-18
  - Verify: Comes with gyro/accelerometer

### FPV Camera & VTx
- FPV Camera 1000 TVL
  - Search: "FPV camera 1000TVL 2.8mm"
  - Price: €15-20
  
- 200mW VTx 5.8GHz
  - Search: "200mW VTx 5.8GHz IRC tramp"
  - Price: €12-18

### Video Receiver
- USB 5.8GHz Video Receiver
  - Search: "USB 5.8GHz wireless video receiver"
  - Price: €15-20
  - Check: Compatibility with Android/iOS phones

### Total AliExpress Cart: ~€80-100
### Typical AliExpress shipping: €5-10 (free at some tier)

---

## Order This Week (EU Hobby Shops)

### Battery
- 3S 1000-1200 mAh LiPo, 30C+ discharge
  - Local hobby shop (faster than AliExpress)
  - Price: €12-15
  - Check: XT30 connector preferred

### Battery Charger
- If you don't already own one
  - IMAX B6AC recommended
  - Price: €20-30
  - But: Often available used for €10-15

### Propellers
- 5-inch propeller set (CW + CCW)
  - Search: "5 inch prop quad"
  - Price: €4-6 per set (buy 2-3 for spares)

### Total Local: €30-40

---

## Already Have (hopefully!)

- ✅ **2x ESP32** — Check your drawer
- ✅ **Filament for 3D printing** — Use PLA or PETG
- ✅ **Micro USB cables** — Use for programming
- ✅ **Soldering iron & solder** — For assembly
- ✅ **Multimeter** — For testing

---

## Shopping Checklist

### Week 1: Place Orders
- [ ] Create AliExpress account
- [ ] Add all parts above to cart
- [ ] Group shipments for same address = lower cost
- [ ] Place order (budget: ~€80-100)
- [ ] Note tracking numbers

- [ ] Visit local hobby shop
- [ ] Order battery + charger
- [ ] Get propellers
- [ ] Ask for "trusted brands" recommendations

### Week 2-3: Parts Arrive (Expect mix)
- [ ] Local shop parts arrive (5-10 days)
- [ ] Start assembly with available parts
- [ ] 3D print frame while waiting

### Week 4+: All Parts In
- [ ] Final assembly
- [ ] Firmware programming
- [ ] Testing indoors
- [ ] First flights!

---

## Money Saving Tips

1. **Bundle shipping** — Order everything together on AliExpress
2. **Compare sellers** — Sort by price, read reviews
3. **Look for "warehouse in [EU country]"** — Faster than China
4. **Watch for discounts** — Use coupons if available
5. **Buy spares together** — Cost drops with bulk

---

## Quality Checks When Parts Arrive

### Motors
- Spin freely by hand
- No weird noises
- Connector matches ESC

### ESCs
- No burnt smell
- Connectors are clean
- Firmware version matches FC needs

### Flight Controller
- All pins intact
- Gyro responds to movement (test with MPU)
- Betaflight compatible

### Connectors
- Gold plated (more reliable)
- Snug fit (not loose)
- No corrosion

---

## Estimated Timeline

| Week | Activity | Notes |
|------|----------|-------|
| 1 | Order parts | Place AliExpress + local orders |
| 2 | Local delivery | Battery, props, connectors arrive |
| 3 | Start 3D printing | Frame parts print while waiting |
| 3-4 | AliExpress arrives | Motors, ESCs, FC, camera/VTx |
| 4-5 | Assembly | Solder, glue, connect components |
| 5 | Firmware | Benjamin writes receiver code |
| 5+ | Testing & flying | Calibrate, tune, first flights |

