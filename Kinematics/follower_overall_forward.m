function [x_e,y_e,z_e,alpha,beta,theta]= fcn(x_d,y_d,z_d,x_t,y_t,theta_t)

% Parameters of the setup
end_tool_length=200; %mm
z_t=-228; %mm

%Distance between end effectors of delta and rrp
M=sqrt((x_t-x_d)^2+(y_t-y_d)^2+(z_t-z_d)^2);

% Unit vector between end effector of rrp to delta
del_x=x_d-x_t;
del_y=y_d-y_t;
del_z=z_d-z_t;
unit=[del_x,del_y,del_z]/M;

% Instrument tip coordinates
x_e=x_d+unit(1)*end_tool_length;
y_e=y_d+unit(2)*end_tool_length;
z_e=z_d+unit(3)*end_tool_length;

% Alpha, beta, theta angles
alpha=atan2(del_x,del_z);
beta=atan2(del_y,del_z);
theta=theta_t;

%adjusting end effector z to be initialy zero
z_e=z_e-end_tool_length;
