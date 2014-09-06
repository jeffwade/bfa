#PROPERTIES

##Switch Combos
- [ ][ ][ ][ ] : COLOR
  - Hue : [0, 360]

- [x][ ][ ][ ] : RADIUS
  - r: [25, height/6] 

- [ ][x][ ][ ] : SHAPE
  - number of sides: 2 => line; [3, 9] => polygon; 10 => circle

- [ ][ ][x][ ] : SPEED
  - [0,10]

- [ ][ ][ ][x] : HEADING
  - angle: [0,360]

- [x][x][ ][ ] : NUMBER
  - [1, 9]

- [x][ ][x][ ] : ARRANGEMENT
  - options: none, line, grid, radial, random

- [x][ ][ ][x] : PADDING
  - [r, 3r]

- [ ][x][x][ ] : ANGLE
  - Theta : [0, 360]

- [ ][x][ ][x] : SPIN
  - Angular velocity : [0, 360]

- [ ][ ][x][x] : CENTER
  - x:[-100,100]

- [x][x][x][ ] : ATTRACTION

- [x][x][ ][x] : BOUNCE
  - range: [0,1]

- [x][ ][x][x] : GRAVITY

- [ ][x][x][x] : WALLS
  - options: combinations of screen sides

- [x][x][x][x] : RANDOM
  - options: shape, color, size, speed, angle, mass, bounce, etc.

## Implement in Main Program
- [x] Number
- [x] Arrangement
- [x] Padding
- [ ] Walls
- [ ] Random

## Implement in Shape Class
- [x] Color
- [x] Radius
- [x] Shape
- [x] Force Strength
- [x] Force Heading
- [x] Angle
- [x] Spin
- [x] Center
- [x] Mass
- [ ] Attraction
- [ ] Bounce
