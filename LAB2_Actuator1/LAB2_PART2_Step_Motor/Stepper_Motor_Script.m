
% motor_enable: [0 -> Disable Motor], 
%               [1 -> Enable Motor]
% drive_mode: [1 -> Full Step Drive], 
%             [2 -> Half Step Drive]
% direction: [cw_dir = 1, ccw_dir = 0 -> Rotate CW], 
%            [cw_dir = 0, ccw_dir = 1 -> Rotate CCW]
% hold_pos: [0 -> Shaft Free], 
%           [1 -> Shaft Lock]
% freq: [adjust frequency range 1 to 6000 Hz]

motor_enable = 0; 
drive_mode = 1;
cw_dir = 0;
ccw_dir = 0;
hold_pos = 0;
freq = 1;