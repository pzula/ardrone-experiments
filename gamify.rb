require 'curses'
require 'argus'

Curses.noecho # do not show typed keys
Curses.init_screen
Curses.stdscr.keypad(true) # enable arrow keys (required for pageup/down)
drone = Argus::Drone.new

def reset
  drone.fly_forward(0)
  drone.up(0)
  drone.turn_right(0)
  drone.turn_left(0)
  drone.down(0)
end

def go_forward
  drone.fly_forward(0)
end

def go_up
  drone.up(0.1)
end

def go_down
  drone.down(0.1)
end

def land
  drone.land
end

def launch
  drone.start
  drone.take_off
end

loop do
  begin
    case Curses.getch
    when Curses::Key::UP
      Curses.setpos(0,0)
      Curses.addstr("UP")
      go_up
    when Curses::Key::DOWN
      Curses.setpos(0,0)
      Curses.addstr("DOWN")
      go_down
    when Curses::Key::LEFT
      Curses.setpos(0,0)
      Curses.addstr("LEFT")
    when Curses::Key::RIGHT
      Curses.setpos(0,0)
      Curses.addstr("RIGHT")
    when 'w'
      Curses.setpos(0,0)
      Curses.addstr("W")
      go_forward
    when 'a'
      Curses.setpos(0,0)
      Curses.addstr("A")
    when 's'
      Curses.setpos(0,0)
      Curses.addstr("S")
    when 'd'
      Curses.setpos(0,0)
      Curses.addstr("D")

    when 'o'
      Curses.setpos(0,0)
      Curses.addstr("O")
      launch
    when 'p'
      Curses.setpos(0,0)
      Curses.addstr("P")
      land
    else reset
    end
  end
end


#while
#  p "Type your command:"
#  command = gets.strip!
#
#  case command
#    when "land"
#      drone.hover.land
#      sleep 5
#      drone.stop
#    when "take_off"
#      drone.start
#      drone.take_off
#    when "quit"
#      drone.hover
#      sleep 5
#      drone.land
#      drone.stop
#      break
#    when /\d/
#      amount = command
#    else
#      begin
#        drone.send(command,amount = 1)
#      rescue => e
#        p e
#      end
#  end
#end
