require 'argus'

#drone.take_off
#sleep 5
#drone.turn_right(1.0)
#sleep 5
#drone.turn_left(1.0)
#sleep 5
#drone.hover.land
#sleep 5
#drone.stop

command = ARGV[0]

drone = Argus::Drone.new
while
    p "Type your command:"
    command = gets.strip!

    case command
    when "land"
      drone.hover.land
      sleep 5
      drone.stop
    when "take_off"
      drone.start
      drone.take_off
    when /fly_forward/
      drone.forward(0.5)  
      sleep 2
      drone.hover
    when /reset/
      @flying = false
      @emergency = false
    when "quit"
      drone.hover
      sleep 5
      drone.land
      drone.stop
      break
   when /\d/
      amount = command
   else
      begin
        drone.send(command,amount = 1)
      rescue => e
        p e
      end
   end
end
