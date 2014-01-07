require 'curses'

Curses.noecho # do not show typed keys
Curses.init_screen
Curses.stdscr.keypad(true) # enable arrow keys (required for pageup/down)

loop do
  case Curses.getch
  when Curses::Key::UP
    Curses.setpos(0,0)
    Curses.addstr("UP")
  when Curses::Key::DOWN
    Curses.setpos(0,0)
    Curses.addstr("DOWN")
  when Curses::Key::LEFT
    Curses.setpos(0,0)
    Curses.addstr("LEFT")
  when Curses::Key::RIGHT
    Curses.setpos(0,0)
    Curses.addstr("RIGHT")
  when 'w'
    Curses.setpos(0,0)
    Curses.addstr("W")
  when 'a'
    Curses.setpos(0,0)
    Curses.addstr("A")
  when 's'
    Curses.setpos(0,0)
    Curses.addstr("S")
  when 'd'
    Curses.setpos(0,0)
    Curses.addstr("D")
  end
end