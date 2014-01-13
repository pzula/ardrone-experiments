## Flying an Ardrone with Ruby and Leapmotion
### Precompiler Hack Day at Codemash 2014
*use at your own risk


### General Usage
Use your `WASD` keys or a [Leapmotion Controller](http://leapmotion.com) to control an [Ardrone Parrot](http://ardrone2.parrot.com)

#### Before:
- Connect to the Ardrone via wifi to use these files without modification
- If you have a LeapMotion controller, download the required drivers from [LeapMotion Developer](http://developer.leapmotion.com)

#### Files
**flight.rb** was our first experimentations with the Argus library. We used this to create a quick command-line application and understand the various access points we had to the Ardrone.

**gamify.rb** was our first look at getting the Curses library integrated with Ardrone for keypad WASD-style control

**curses_demo.rb** got the Curses integration working correctly with the Ardrone

**leap_controller.rb** can be run with a connected LeapMotion controller. The gestures that are supported are moving your hand up for takeoff, and down for landing. Frame rate is a bit of a problem that still needs to be tackled for more consistent results.

#### Points of reference for the LeapMotion

HOVER:
  x: -10, 10
  y: 90, 110
  z: 145, 160

FORWARD:
  x:
  y: 0, <90
  z:

BACKWARD:
  x:
  y: -130, 150
  z:

LEFT:
  x:-110, <-10
  y:
  z:

RIGHT:
  x:>10, 150
  y:
  z:

TAKE_OFF / UP:
  x:
  y:
  z:>160, 300

LAND / DOWN:
  x:
  y:

 z:65, <145
