function [x_d,y_d,z_d,x_t,y_t,theta_t] = fcn(x_e, y_e, z_e, alpha_e, beta_e, theta_e)

% Offset between the z of 3rrp and delta end effector at initial point
z_offset=500; %mm

% Instrument tip coordinates are assigned as delta tip coordinates
x_d=x_e;
y_d=y_e;
z_d=z_e;
theta_t=theta_e;

% Height difference
del_z=z_offset-z_e;

%Unit vector
v=[tan(alpha_e),tan(beta_e),1];
n=norm(v);
unit_v=v/n;

%Distance between end effectors of delta and rrp and unit vector
M=del_z/unit_v(3);

%3RRP xy coordinates
x_t=x_e-M*unit_v(1);
y_t=y_e-M*unit_v(2);
