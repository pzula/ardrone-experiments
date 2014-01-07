require 'artoo'
require 'argus'

connection :leapmotion, :adaptor => :leapmotion, :port => '127.0.0.1:6437'
device :leapmotion, :driver => :leapmotion

drone = Argus::Drone.new

work do
  on leapmotion, :open => :on_open
  on leapmotion, :frame => :on_frame
  # on leapmotion, :close => :on_close
end

def on_open(*args)
  puts "Egadrone is ready for gestures"
end

def on_frame(*args)
  frame = args[1]
  #puts frame
  frame.hands.each do |hand|
    puts "x: #{hand.palm_x}, y: #{hand.palm_y}, z: #{hand.palm_z}"
    if forward?(hand) fly_forward


  end
  #puts frame.gestures
  #sleep 3
  #puts frame.pointables
end

def on_close(*args)
  puts args
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

def fly_forward
  drone.forward(0.5)  
  sleep 2
  drone.hover
end
