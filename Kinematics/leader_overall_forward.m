function [x_e, y_e, z_e, alpha_e, beta_e, theta_e] = fcn(x_d,y_d,z_d,x_t,y_t,theta_t)

% Offset between the z of 3rrp and delta end effector at initial point
z_offset=500; %mm

% Unit vector between end effector of rrp to delta
del_x=x_d-x_t;
del_y=y_d-y_t;
del_z=z_offset-z_d;

%Distance between end effectors of delta and rrp and unit vector
% M=sqrt((x_t-x_d)^2+(y_t-y_d)^2+(z_offset-z_d)^2);
% unit=[del_x,del_y,del_z]/M;

% Alpha, beta, theta angles
alpha_e=atan2(del_x,del_z);
beta_e=atan2(del_y,del_z);
theta_e= theta_t;

% Instrument tip coordinates are assigned as delta tip coordinates
x_e=x_d;
y_e=y_d;
z_e=z_d;
