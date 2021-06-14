
%Variable
syms t1 t2 t3 t4 t5; 
syms d2;

%Constant (use numbers only for check point)
d1=0.5;
a2=0.3;
a3=0.25;
d5=0.15;

%Forward kinematics(4.1.4)
    %transformation matrix (4.1.4.1)
    A1=[cos(t1) -sin(t1) 0 0 ; sin(t1) cos(t1) 0 0; 0 0 1 d1; 0 0 0 1];
    A2=[1 0 0 0; 0 1 0 0; 0 0 1 d2; 0 0 0 1];
    A3=[1 0 0 a2; 0 0 1 0; 0 -1 0 0; 0 0 0 1];   
    A4=[cos(t2) 0 -sin(t2) a3*cos(t2); sin(t2) 0 cos(t2) a3*sin(t2); 0 -1 0 0; 0 0 0 1]; 
    A5=[cos(t3) 0  -sin(t3)  0; sin(t3) 0 cos(t3) 0; 0 -1 0 0; 0 0 0 1]; 
    A6=[cos(t4) 0 sin(t4) 0; sin(t4) 0 -cos(t4) 0; 0 1 0 0; 0 0 0 1];
    A7=[cos(t5) -sin(t5) 0 0; sin(t5) cos(t5) 0 0; 0 0 1 d5; 0 0 0 1];
   
    %transformation matrix end unit(4.1.4.2)
    An=simplify(simplify(A1*A2)*simplify(A3*A4)*simplify(A5*A6)*A7)
   
    %check point (4.1.4.3)
    point1=[0, 0, 0, pi/2, 0,0.1];
    point2=[pi/2, pi/2, pi/2, pi/2, pi/2, 0.2];
    point3=[pi, -pi/2, pi/2, -pi/2, 0, 0.3];
    point4=[3*pi/2, pi/2, 3*pi/2, pi/2, 3*pi/2, 0.4];
    point5=[2*pi, 0, pi/2, pi/2, -3*pi/2, 0.5];
    point=[point1; point2; point3; point4; point5]; %Define a matrix for the points

for (k=1:5)
    pp=point(k,:); %point 1-5
    A=subs(An, {t1, t2, t3, t4, t5, d2}, pp); %The transformation matrix for each point
   
    %End unit location
    d0_1=subs((A1*[0;0;0;1]), {t1, t2, t3, t4, t5, d2}, {pp});
    d0_2=subs((A1*A2*[0;0;0;1]), {t1, t2, t3, t4, t5, d2}, {pp});
    d0_3=subs((A1*A2*A3*[0;0;0;1]), {t1, t2, t3, t4, t5, d2}, {pp});
    d0_4=subs((A1*A2*A3*A4*[0;0;0;1]), {t1, t2, t3, t4, t5, d2}, {pp});
    d0_5=subs((A1*A2*A3*A4*A5*[0;0;0;1]), {t1, t2, t3, t4, t5, d2}, {pp});
    d0_6=subs((A1*A2*A3*A4*A5*A6*[0;0;0;1]), {t1, t2, t3, t4, t5, d2}, {pp});
    d0_7=subs((A1*A2*A3*A4*A5*A6*A7*[0;0;0;1]), {t1, t2, t3, t4, t5, d2}, {pp})
    
    %Location of each joint
    x1=[0,0];
    y1=[0,0];
    z1=[0,d0_1(3)];

    x2=[0,d0_2(1)];
    y2=[0,d0_2(2)];
    z2=[d0_1(3),d0_2(3)];

    x3=[d0_2(1),d0_3(1)];
    y3=[d0_2(2),d0_3(2)];
    z3=[d0_2(3),d0_3(3)];
    
    x4=[d0_3(1),d0_4(1)];
    y4=[d0_3(2),d0_4(2)];
    z4=[d0_3(3),d0_4(3)];
   
    x5=[d0_4(1),d0_5(1)];
    y5=[d0_4(2),d0_5(2)];
    z5=[d0_4(3),d0_5(3)];
    
    x6=[d0_5(1),d0_6(1)];
    y6=[d0_5(2),d0_6(2)];
    z6=[d0_5(3),d0_6(3)];
    
    x7=[d0_6(1),d0_7(1)];
    y7=[d0_6(2),d0_7(2)];
    z7=[d0_6(3),d0_7(3)];
 
    %plots
    subplot(2,3,k)
    plot3(x1,y1,z1 , x2,y2,z2 , x3,y3,z3, x4,y4,z4, x5,y5,z5, x6,y6,z6, x7,y7,z7)
    hold on
    title ('point',k)
    axis([-1.2 1.2 -1.2 1.2 0 1.2])
    grid
end
    
