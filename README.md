# fpga_led_bounce
FPGA led that bounces back and forth from led[0] to led[15] and back. day 2 of my 30 day FPGA challenge

further learned about type safety and equalities. Had to draw out the logic in order to give the view that the led is really bouncing back and forth from led[0] to led[15]. Utilized math to map out how to properly segment a period size of 1 second amongst 29 different states of the FPGA. Pretty simple step up from day 1 project. challenge I could give to myself is finding a way to replace the exhaustive list of if statements with a generate statement. 
