function [x_d,y_d,z_d,x_t,y_t,theta_t]= fcn(x_e,y_e,z_e,alpha,beta,theta)
%Setup parameters
end_tool_length=200; %mm
z_t=-228; %mm

%adjusting end effector z to be initialy zero
z_e=z_e+end_tool_length;

%Unit vector
v=[tan(alpha),tan(beta),1];
n=norm(v);
unit_v=v/n;

% Delta end points
x_d=x_e-unit_v(1)*end_tool_length;
y_d=y_e-unit_v(2)*end_tool_length;
z_d=z_e-unit_v(3)*end_tool_length;

% 3RRP end points
delta_z= z_d-z_t;
k=delta_z/unit_v(3);

x_t=x_d-unit_v(1)*k;
y_t=y_d-unit_v(2)*k;
theta_t=theta;
