%{
 NAME           : trackBot_script
 AUTHOR         : Thanacha Choopojcharoen
 DATE           : August 7th 2021
 MODIFIED BY    : -
 DESCRIPTION    : An example of how to use trackBot() and plot_trackBot()
%}

% press ctrl+c to cancel simulation

clear;
load('testcase_15');
[P_test,p_f_test,flag_test] = trackBot(p_i,c);
all(abs(P-P_test)<0.00000001,'all')

% plot_trackBot(P);
%%
clf
clear;
load('success_case_with_wall');
% [P,p_f,flag] = trackBot(p_i,c,W);
plot_trackBot(P,W)