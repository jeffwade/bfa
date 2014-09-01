#PROPERTIES

##Switch Combos
- [ ][ ][ ][ ] : Color
  - Hue
  - range: 0–360
- [x][ ][ ][ ] : Radius
  - range: 25–???
- [ ][x][ ][ ] : Number
  - range: 1–???
- [ ][ ][x][ ] : Angle
  - range: 0–360º
- [ ][ ][ ][x] : Speed - Magnitude (velocity)
  - range: 0–10
- [x][x][ ][ ] : Padding
  - max less than width or height
- [x][ ][x][ ] : Heading - Direction (velocity)
  - range: 0–360º
- [ ][x][x][ ] : Shape
  - number of sides: 2=line; 3...???= polygon; >???=circle; top=random?
  - range: 0–??
- [x][ ][ ][x] : Magnitude (acceleration)
  - range: 0–??
- [ ][x][ ][x] : Direction (acceleration)
  - range: 0–360º
- [ ][ ][x][x] : Angular velocity
  - range: 0–360º
- [x][x][x][ ] : Arrangement
  - options: grid, checker, circle, shape, ???
- [x][x][ ][x] : Mass
  - range: ???
- [x][ ][x][x] : Bounce (coeff. of restitution)/center of rotation
  -
- [ ][x][x][x] : Walls
  - options: combinations of
- [x][x][x][x] : Order/attraction/repulsion
  - options: shape, color, size, speed, angle, mass, bounce, random

## Implement in Main Program
- [x] Number
- [x] Padding
- [ ] Arrangement
- [ ] Order
- [ ] Walls

## Implement in Shape Class
- [x] Color
- [x] Radius
- [x] Angle
- [x] Shape
- [ ] Mass
- [ ] Bounce/center of rotation
- [x] Speed - Magnitude (velocity)
- [x] Heading - Direction (velocity)
- [ ] Magnitude (acceleration)
- [ ] Direction (acceleration)
- [ ] Angular velocity