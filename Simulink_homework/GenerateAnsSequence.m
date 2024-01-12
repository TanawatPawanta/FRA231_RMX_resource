function [ans_seq] = GenerateAnsSequence(floor_Data, door_Data)
    floor_seq = floor_Data * 100;
    door_seq = door_Data * [1 0 0 0 0; 0 2 0 0 0; 0 0 4 0 0; 0 0 0 8 0; 0 0 0 0 16];
    check_seq = floor_seq;
    for i = 1:5
        check_seq = check_seq + door_seq(:, i);
    end
    row = size(check_seq, 1);
    ans_seq = check_seq(1, 1);
    for i = 2:row
        if check_seq(i, 1) ~= ans_seq(end, 1)
            ans_seq(end + 1, 1) = check_seq(i, 1);
        end
    end
end