function [x,y,z]= fcn(L_1,L_2,L_3)

S_B= 253; % Big triangle side (mm)
s_P= 113; % Small triangle side (mm)

W_B= S_B*sqrt(3)/6 ; % Big triangle distance from origin to side (mm)
w_P= s_P*sqrt(3)/6 ; % Small triangle distance from origin to side (mm)

U_B= S_B*sqrt(3)/3 ;% Big triangle distance from origin to corner (mm)
u_P= s_P*sqrt(3)/3 ;% Small triangle distance from origin to corner (mm)

l=225; % link length (mm)

% Transition Parameters
a=(S_B-s_P)/2;
b=W_B-w_P;
c=u_P-U_B; % Careful to the sign

d=(L_2-L_1)/(2*a);
e=(L_2^2-L_1^2)/(4*a);

D=(L_3-L_1-a*d)/(b-c);
E=(c^2-a^2-b^2-2*a*e+L_3^2-L_1^2)/(2*(b-c));

A=d^2+D^2+1;
B=2*(d*e+D*E+c*D+L_3);
C=e^2+E^2+c^2+2*c*E+L_3^2-l^2;

z1=(-B-sqrt(B^2-4*A*C))/(2*A);
x1=d*z1+e;
y1=D*z1+E;

% Rotation Matrix
phi=-pi/3;
R_z=[cos(phi) -sin(phi) 0;sin(phi) cos(phi) 0; 0 0 1];
A= R_z*[x1;y1;z1];
x=A(1);
y=A(2);
z=-A(3)-210;
