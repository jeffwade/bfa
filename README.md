#IN FIERI
An interactive exhibit built with Arduino & Processing. 

##Project Files
+ `_support/` : partials and experimentation
  - `arduino/` : support files for arduino
  - `processing/` : support files for processing
+ `infierino/` : main arduino project folder
  + `infierino.ino` : main arduino code
+ `inprocess/` : main processing project folder
  + `inprocess.pde` : main processing code
    + `motionBlur.pde` : function for emulating motion blur
    + `readInputs.pde` : funtion for reading arduino inputs
    + `changeProperties.pde` : function containing interaction rules
    + `arrangeShapes.pde` : defines how shapes are arranged
  + `Shape.pde` : Shape class
    + `drawShape.pde` : function to draw shape according to number of sides


###Documentation
+ `README.md` : this document
+ `STATEMENT.md` : artist's statement
+ `TASK-LIST.md` : current work plan
+ `TECH.md` : technologies used
