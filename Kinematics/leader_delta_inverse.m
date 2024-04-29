function [L_1_inv,L_2_inv,L_3_inv]= fcn(x1,y1,z1)

% Rotation Matrix
phi=0;
R_z=[cos(phi) -sin(phi) 0;sin(phi) cos(phi) 0; 0 0 1];
A= R_z*[x1;y1;-z1-202];
x=A(1);
y=A(2);
z=A(3);


S_B= 235; % Big triangle side (mm)
s_P= 88; % Small triangle side (mm)

W_B= S_B*sqrt(3)/6 ; % Big triangle distance from origin to side (mm)
w_P= s_P*sqrt(3)/6 ; % Small triangle distance from origin to side (mm)

U_B= S_B*sqrt(3)/3 ;% Big triangle distance from origin to corner (mm)
u_P= s_P*sqrt(3)/3 ;% Small triangle distance from origin to corner (mm)

l=220; % link length (mm)

% Transition Parameters
a=(S_B-s_P)/2;
b=W_B-w_P;
c=u_P-U_B; % Careful to the sign

C_1=x^2+y^2+z^2+a^2+b^2+2*a*x+2*b*y-l^2;
C_2=x^2+y^2+z^2+a^2+b^2-2*a*x+2*b*y-l^2;
C_3=x^2+y^2+z^2+c^2+2*c*y-l^2;


if z^2-C_1>=0
    L_1_inv=-z-sqrt(z^2-C_1);
else
    L_1_inv=-z;
end
    
if z^2-C_2>=0
    L_2_inv=-z-sqrt(z^2-C_2);
else
    L_2_inv=-z;
end

if z^2-C_3>=0
    L_3_inv=-z-sqrt(z^2-C_3);
else
    L_3_inv=-z;
end
