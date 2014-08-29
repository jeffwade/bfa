#PROPERTIES

##Switch Combos
- [ ][ ][ ][ ] : Color
  - HSBa: full range of hue; limited saturation, value and alpha
- [x][ ][ ][ ] : Radius
  - range within set min and max
- [ ][x][ ][ ] : Number
  - range, 1–???
- [ ][ ][x][ ] : Angle
  - 0–360º
- [ ][ ][ ][x] : Magnitude (velocity)
  - 0–(10?)
- [x][x][ ][ ] : Spacing
  - max less than width or height
- [x][ ][x][ ] : Direction (velocity)
  - 0–360º
- [ ][x][x][ ] : Shape
  - number of sides: 2=line; 3...???= polygon; >???=circle; top=random?
- [x][ ][ ][x] : Magnitude (acceleration)
  - limit
- [ ][x][ ][x] : Duration (acceleration)
  - pulse? milliseconds? while switch is closed?
- [ ][ ][x][x] : Direction (acceleration)
  - 0–360º
- [x][x][x][ ] : Arrangement
  - grid, checker, circle, shape, ???
- [x][x][ ][x] : Mass
  - range: ???
- [x][ ][x][x] : Bounce (coeff. of restitution)/center of rotation
  -
- [ ][x][x][x] : Walls/Angular velocity
  - 1–4 different combos
- [x][x][x][x] : Order
  - based on shape, color, size, speed, angle, mass, bounce, random

## Implement in Main Program
- [ ] Number
- [ ] Spacing
- [ ] Arrangement
- [ ] Order
- [ ] Walls

## Implement in Shape Class
- [x] Color
- [x] Radius
- [ ] Shape
- [ ] Mass
- [ ] Bounce/center of rotation
- [ ] Angle
- [ ] Location
  - (determined by `Number`, `Spacing`, and `Arrangment` when stationary)
- [ ] Magnitude (velocity)
- [ ] Direction (velocity)
- [ ] Magnitude (acceleration)
- [ ] Duration (acceleration)
- [ ] Direction (acceleration)
- [ ] Angular velocity