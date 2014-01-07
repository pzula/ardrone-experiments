require 'argus'
require 'curses'

Curses.noecho # do not show typed keys
Curses.init_screen
Curses.stdscr.keypad(true) # enable arrow keys (required for pageup/down)

drone = Argus::Drone.new

loop do
  case Curses.getch
  when Curses::Key::UP
    puts 'moving up'
    drone.forward(0.5)  
    sleep 2
    drone.hover
  when Curses::Key::DOWN
    puts 'moving down'
    drone.down(0.5)  
    sleep 2
    drone.hover
  when Curses::Key::LEFT
    puts 'moving left'
    drone.left(0.5)  
    sleep 2
    drone.hover
  when Curses::Key::RIGHT
    puts 'moving right'
    drone.right(0.5)  
    sleep 2
    drone.hover
  when 'a'
    puts 'moving forward'
    drone.forward(0.5)  
    sleep 2
    drone.hover
  when 'z'
    puts 'moving backward'
    drone.backward(0.5)  
    sleep 2
    drone.hover
  when 't'
    puts 'taking off'
    drone.start
    drone.take_off
  when 'l'
      drone.hover.land
      sleep 2
      drone.stop
  end
end
