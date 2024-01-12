%{
    NAME            : automatic_test_script_HW1part2
    AUTHORS         : P. Tanawat and A. Tanakon
    DATE            : Augus 28th 2023
    MODIFIED BY     : -
    DECRIPTION      : This is script for check that your model can complete
                      task in any test case.
%}
%v2.1
main_dir = pwd ;
hw_zip = dir(fullfile(pwd,'*.zip'));
file_name = {hw_zip.name}';
testcase = cell(20,1);
student_number = (1:80)';
grade_df = cat(2, student_number, zeros(80,10));
for i = 1:numel(testcase)  
        testcase{i} = sprintf('test_case%d_v2',i);
end
%Check class work or homework
for i = 1:numel(file_name)
    name = file_name{i};
    if name(14)=='H'
        n = 2;
        class = 1;
    elseif name(14)=='c'
        n = 2;
        class = 2;
    else 
        if name(17)=='H'
            n = 3;
            class = 1;
        elseif name(17)=='c'
            n = 3;
            class = 2;
        end
    end
    ID = sort([str2num(name([8 9])) str2num(name([11 12])) str2num(name([14 15]))]);
    try
        unzip(name,[num2str(class) sprintf('_%d',ID)])
        
        test_folder = [main_dir '\' [num2str(class) sprintf('_%d',ID)]];
        sim_model = "Simplifly_Multiple_Elevator_v2_1";
        for j = 1:2:numel(testcase)
            load(testcase{j}) 
            initInput = [initInput.Time initInput.Data];
            cd(test_folder) 
            try
                open_system(sim_model);
                simOut = sim(sim_model);
                close_system(sim_model, 0);
            catch
                disp("error unable open and run Simulink model.")
                for k = 1:numel(ID)
                    grade_df(ID(k),j+1,class) = false;
                end
            end
            cd ..
            AnsE1 = GenerateAnsSequence(simOut.E1_floor.Data,simOut.E1_DoorsStatus.Data);
            AnsE2 = GenerateAnsSequence(simOut.E2_floor.Data,simOut.E2_DoorsStatus.Data);
            isCorrect = isequal(AnsE1,AnsSeqE1) & isequal(AnsE2,AnsSeqE2);
            for k = 1:numel(ID)
                grade_df(ID(k),j+1,class) = isCorrect;
            end
        end
    catch
        disp('error unzipping.')
        disp([class ID])
        for k = 1:numel(ID)
             grade_df(ID(k),:,class) = false;
        end
    end
end

your_ID = 61
class = 1;   
grade_df(your_ID,:,class);
homework_pass = grade_df(your_ID,2:2:21,class);
per = sum(homework_pass)*10;
disp(sprintf('Your HW1 percentage (ID==%d) is %.2f out of 100',your_ID,per))