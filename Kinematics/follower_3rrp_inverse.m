function [q_4,q_5,q_6]= fcn(x1,y1,theta1)
l_1=145;
l_2=l_1;
l_3=l_1;

% Rotation Matrix
phi=0;
R_z=[cos(phi) -sin(phi);sin(phi) cos(phi)];
A= R_z*[x1;y1];
x=A(1);
y=-A(2);
theta=theta1+phi;

K_1=x*sin(theta+3*pi/6)-y*cos(theta+3*pi/6);
K_2=x*sin(theta+7*pi/6)-y*cos(theta+7*pi/6);
K_3=x*sin(theta+11*pi/6)-y*cos(theta+11*pi/6);

M_1=K_1*cos(theta+3*pi/6)-sqrt(l_1^2-K_1^2)*sin(theta+3*pi/6);
L_1=-K_1*sin(theta+3*pi/6)-sqrt(l_1^2-K_1^2)*cos(theta+3*pi/6);

M_2=K_2*cos(theta+7*pi/6)-sqrt(l_2^2-K_2^2)*sin(theta+7*pi/6);
L_2=-K_2*sin(theta+7*pi/6)-sqrt(l_2^2-K_2^2)*cos(theta+7*pi/6);

M_3=K_3*cos(theta+11*pi/6)-sqrt(l_3^2-K_3^2)*sin(theta+11*pi/6);
L_3=-K_3*sin(theta+11*pi/6)-sqrt(l_3^2-K_3^2)*cos(theta+11*pi/6);

q_4=atan2(M_1,L_1)-3*pi/6+pi;
q_5=atan2(M_2,L_2)-7*pi/6+pi;
q_6=atan2(M_3,L_3)-11*pi/6+pi;

if q_6<-pi
    q_6=q_6+2*pi;
end

if q_5<-pi
    q_5=q_5+2*pi;
end

temp=q_5;
q_5=q_6;
q_6=temp;
