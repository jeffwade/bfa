#PROPERTIES

##Switch Combos
- 0. [ ][ ][ ][ ] : COLOR
  - Hue : [0, 360]

- 1. [x][ ][ ][ ] : RADIUS
  - r: [25, height/6]

- 2. [ ][x][ ][ ] : SHAPE
  - number of sides: 2 => line; [3, 9] => polygon; 10 => circle

- 3. [ ][ ][x][ ] : FORCE
  - [0,10]

- 4. [ ][ ][ ][x] : HEADING
  - angle: [0,360]

- 5. [x][x][ ][ ] : NUMBER
  - [1, 9]

- 6. [x][ ][x][ ] : ARRANGEMENT
  - options: none, line, grid, radial, random

- 7. [x][ ][ ][x] : PADDING
  - [r, 3r]

- 8. [ ][x][x][ ] : ANGLE
  - Theta : [0, 360]

- 9. [ ][x][ ][x] : SPIN
  - Angular velocity : [0, 360]

-10. [ ][ ][x][x] : CENTER
  - x:[-100,100]

-11. [x][x][x][ ] : ATTRACTION

-12. [x][x][ ][x] : BOUNCE
  - range: [0,1]

-13. [x][ ][x][x] : MASS

-14. [ ][x][x][x] : WALLS
  - options: combinations of screen sides

-15. [x][x][x][x] : RANDOM
  - options: shape, color, size, speed, angle, mass, bounce, etc.

## Implement in Main Program
- [x] Number
- [x] Arrangement
- [x] Padding
- [x] Mass
- [x] Walls
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
- [x] Attraction
- [ ] Bounce
