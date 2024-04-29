function [x,y,theta]= fcn(q_4,q_5,q_6)
l_1=175; %in default position, the distance between the output xy point to the rotating slide heads
l_2=l_1;
l_3=l_1;

%temp=q_5; % just swapping the q's
%q_5=q_6;
%q_6=temp;

q_4=q_4+3*pi/6; % First q has 90 degrees angle with our original coordinate systems x axis
q_5=q_5+7*pi/6; % with respect to first q, the rests of the slide heads has 60 degree in between (2pi/3)
q_6=q_6+11*pi/6; % with respect to first q, the rests of the slide heads has 60 degree in between (2pi/3)

% Following is positions of the slide heads in coordinate system
c=[l_1*cos(q_4) l_1*sin(q_4);
   l_2*cos(q_5) l_2*sin(q_5);
   l_3*cos(q_6) l_3*sin(q_6)];

K=c(1,2)+c(3,2)+sqrt(3)*c(3,1)-2*c(2,2)-sqrt(3)*c(1,1);
L=c(1,1)+c(3,1)+sqrt(3)*c(1,2)-2*c(2,1)-sqrt(3)*c(3,2);
M=L*(L-sqrt(3)*K)*c(1,2)-L*(K+sqrt(3)*L)*c(1,1)-(L-sqrt(3)*K)*(L*c(2,2)-K*c(2,1));

x1=-M/(sqrt(3)*(K^2+L^2));
y1=c(2,2)-K*c(2,1)/L-K*M/(sqrt(3)*L*(K^2+L^2));
theta1=atan2(K,L)-pi/6;

if theta1<-pi
    theta1=theta1+2*pi;
end

% Rotation Matrix
phi=pi/3;
R_z=[cos(phi) -sin(phi);sin(phi) cos(phi)];
A= R_z*[x1;y1];
x=-A(1);
y=-A(2);
theta=-theta1;
