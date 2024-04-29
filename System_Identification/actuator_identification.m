% Alperen Kenan
clc;
close all;
clear all;

% Load Input(Force) - Output (Position) Data 

xt_step=load('xt_step_1.mat');
ft_step=load("ft_step_1.mat");
x_step=xt_step.data.Data;
f_step=ft_step.data.Data;

xt_ramp=load('xt_ramp_1.mat');
ft_ramp=load('ft_ramp_1.mat');
x_ramp=xt_ramp.data.Data;
f_ramp=ft_ramp.data.Data;

xt_sine=load('xt_sine_1.mat');
ft_sine=load('ft_sine_1.mat');
x_sine=xt_sine.data.Data;
f_sine=ft_sine.data.Data;

xt_chirp=load('xt_chirp.mat');
ft_chirp=load("ft_chirp.mat");
xt_chirp=xt_chirp.data.Data;
ft_chirp=ft_chirp.data.Data;

% Create iddata object
data = iddata(xt_chirp, ft_chirp, 0.1);

% Estimate transfer function
sys = tfest(data, 2, 0)

% Normalise tf
[num, den] = tfdata(sys, 'v');
normalized_num = num / num(3);
normalized_den = den / num(3)

%;
%normalized_sys = tf(normalized_num, normalized_den)
