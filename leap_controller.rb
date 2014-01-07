require 'artoo'
require 'pry'

connection :leapmotion, :adaptor => :leapmotion, :port => '127.0.0.1:6437'
device :leapmotion, :driver => :leapmotion

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

work do
  on leapmotion, :open => :on_open
  on leapmotion, :frame => :on_frame
  on leapmotion, :close => :on_close
end

def on_open(*args)
  puts args
end

def ready?
  @ready ||= true
end

def on_frame(*args)
  #return if !ready?
  frame = args[1]
  # #puts frame
  # frame.hands.each do |hand|
  return if frame.hands.empty?
  hand = frame.hands.first
    #binding.pry
    puts "x: #{hand.palm_x}, y: #{hand.palm_y}, z: #{hand.palm_z}"
    #fly_forward if forward?(hand)
    #fly_backward if backward?(hand)
    #roll_right if right?(hand)
    #roll_left if left?(hand)
    lift_off if lifted?(hand)
    landing if lowered?(hand)
    steady if hover?(hand)
  # end
  #pause_work
  #sleep 2
  #continue_work
  #puts frame.gestures
  #sleep 3
  #puts frame.pointables

  # drone.start
  # drone.take_off
  # drone.hover
  # sleep 1
  # drone.land
  # drone.stop
end

def on_close(*args)
  puts args
end

def lifted?(hand)
  (160..300).include?(hand.palm_z)
end

def lowered?(hand)
  (65..145).include?(hand.palm_z)
end

def hover?(hand)
  (-10..10).include?(hand.palm_x) &&
  (90..130).include?(hand.palm_y) &&
  (145..160).include?(hand.palm_z)
end

def forward?(hand)
  (-10..10).include?(hand.palm_x) &&
  (0..90).include?(hand.palm_y) &&
  (145..160).include?(hand.palm_z)
end

def backward?(hand)
  (-10..10).include?(hand.palm_x) &&
  (130..150).include?(hand.palm_y) &&
  (145..160).include?(hand.palm_z)
end

def left?(hand)
  (-10..-110).include?(hand.palm_x) &&
  (90..130).include?(hand.palm_y) &&
  (145..160).include?(hand.palm_z)
end

def right?(hand)
  (10..150).include?(hand.palm_x) &&
  (90..130).include?(hand.palm_y) &&
  (145..160).include?(hand.palm_z)
end

def steady
  @ready = false
  drone.start
  drone.take_off
  drone.hover
  @ready = true
end

def fly_forward
  drone.forward(0.5)
  sleep 2
  drone.hover
end

def fly_backward
  drone.backward(0.5)
  sleep 2
  drone.hover
end

def roll_right
  drone.right(0.5)
  sleep 2
  drone.hover
end

def roll_left
  drone.left(0.5)
  sleep 2
  drone.hover
end

def lift_off
  # @ready = false
  puts 'we have lift off!'
  drone.start
  drone.take_off
  # @ready = true
end

def landing
  # @ready = false
  puts "landing"
  unless drone.nil?
    drone.hover
    sleep 1
    drone.land
    drone.stop
  end
  # @ready = true
end





