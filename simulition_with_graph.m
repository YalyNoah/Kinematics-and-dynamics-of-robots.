%Just for graph, most of our plots at this code, for each plot the user
%need to unmark the specific graph.

%const
d1=0.5;
a2=0.3;
a3=0.25;
d5=0.15;

%Initial and final location
ds=input('enter start piont, like [X;Y;Z]:')
dg=input('enter end piont, like [X;Y;Z]:')
%Rs=input('enter start orientetion, (matrix 3*3):')
%Rg=input('enter end orientetion, (matrix 3*3):')


%Roll pitch yaw (start)
 tx=input('enter start roll:') 
 ty=input('enter start pitch:') 
 tz=input('enter start yaw:') 
 
 nx=cos(tx)*sin(ty);
 ny=sin(tx)*sin(ty);
 nz=cos(ty);
 k=1-cos(tz);
 
 Rs=[cos(tz)+k*nx^2,nx*ny*k-nz*sin(tz),nx*nz*k+ny*sin(tz);
 nx*ny*k+nz*sin(tz),k*ny^2+cos(tz),nz*ny*k-nx*sin(tz);
 nx*nz*k-ny*sin(tz),nz*ny*k+nx*sin(tz),k*nz^2+cos(tz)]
 
%Roll pitch yaw (end)
 tx=input('enter end roll:') 
 ty=input('enter end pitch:') 
 tz=input('enter end yaw:') 
 
 nx=cos(tx)*sin(ty);
 ny=sin(tx)*sin(ty);
 nz=cos(ty);
 k=1-cos(tz);
 
 Rg=[cos(tz)+k*nx^2,nx*ny*k-nz*sin(tz),nx*nz*k+ny*sin(tz);
 nx*ny*k+nz*sin(tz),k*ny^2+cos(tz),nz*ny*k-nx*sin(tz);
 nx*nz*k-ny*sin(tz),nz*ny*k+nx*sin(tz),k*nz^2+cos(tz)]


Rb=Rg*transpose(Rs);

%angle
tetal=acos((trace(Rb)-1)/2);

%eigenvector
if tetal==0
    n=[0;0;0];    
else
    n(1)=(Rb(3,2)-Rb(2,3))/(2*sin(tetal));
    n(2)=(Rb(1,3)-Rb(3,1))/(2*sin(tetal));
    n(3)=(Rb(2,1)-Rb(1,2))/(2*sin(tetal));
end

%now we have n and teta
%time
T=30;
t_1=T/3;
t_2=(2*T)/3;
a=1/(0.5*t_1^2+t_1*(t_2-t_1)+0.5*(2*t_1-(T-t_2))*(T-t_2));

%location
Po=ds;
Rtt=Rs;
for t=1:T
if 0<t && t<t_1
s=0.5*a*t^2;

else
    if t_1<=t && t<=t_2
    s=0.5*a*t_1^2+a*t_1*(t-t_1);
    
    else
        if t_2<t && t<=T
    s=0.5*a*t_1^2+a*t_1*(t_2-t_1)+0.5*(t-t_2)*(2*a*t_1-a*(t-t_2));

        end
    end
end
d_t=ds+s*(dg-ds);
Po(1,t+1)=d_t(1);
Po(2,t+1)=d_t(2);
Po(3,t+1)=d_t(3);
%plot3(d_t(1), d_t(2), d_t(3), 'r.')
%plot3(Po(1), Po(2), Po(3), 'r.')
%axis ([0 15  0 0.2])
%hold on

teta=tetal*s
k=1-cos(teta);
Rot=[cos(teta)+k*n(1)^2,n(1)*n(2)*k-n(3)*sin(teta),n(1)*n(3)*k+n(2)*sin(teta);
n(1)*n(2)*k+n(3)*sin(teta),k*n(2)^2+cos(teta),n(3)*n(2)*k-n(1)*sin(teta);
n(1)*n(3)*k-n(2)*sin(teta),n(3)*n(2)*k+n(1)*sin(teta),k*n(3)^2+cos(teta)]
Rt=Rot*Rs;
Rtt(:,:,t+1)=Rt;

%4.1.10.2.3
%plot (t, teta, 'b.')
%xlabel('time [sec]'),ylabel('tetha [rad]')
  %  hold on
    
end
%grid on
%now we have matrix with linear end pionts



j=1;
for j=1:30 %for the linear graph
%plot3(Po(1,j),Po(2,j), Po(3,j), 'b.')
%axis([-1 1 -1 1 0 2])
% xlabel('x')
% ylabel('y')
% zlabel('z')
% hold on
% grid on
%4.1.10.2.3
%     plot (j, Po(1,j), 'b.')
%     hold on
%     plot (j, Po(2,j), 'm.')
%     hold on
%     plot (j, Po(3,j) , 'r.')
%     hold on
%     xlabel('time [sec]'),ylabel('position [m]')
%     legend ('x','y','z')
%     grid on
end
%hold off

 j=1;
for j=1:30
    
    x=Po(1,j);
    y=Po(2,j);
    z=Po(3,j);
    
    Rn=Rtt(:,:,j)
   
    Pc=[x;y;z]-Rn*[0;0;d5];
    x=Pc(1);
    y=Pc(2);
    z=Pc(3);
    %plot3(Pc(1),Pc(2), Pc(3), 'b.')
    %hold on
    
    %%%oposit%%%
    t1=atan2(y,x)

    cos2=(x-a2*cos(t1))/a3*cos(t1);
    D=cos2;
    sin2=sqrt(1-D^2);
    sin2=real(sin2);

    t2=atan2(sin2,cos2)
    d2=z-d1+a3*sin(t2)
    
A1=[cos(t1) -sin(t1) 0 0 ; sin(t1) cos(t1) 0 0; 0 0 1 d1; 0 0 0 1];
A2=[1 0 0 0; 0 1 0 0; 0 0 1 d2; 0 0 0 1];
A3=[1 0 0 a2; 0 0 1 0; 0 -1 0 0; 0 0 0 1];   
A4=[cos(t2) 0 -sin(t2) a3*cos(t2); sin(t2) 0 cos(t2) a3*sin(t2); 0 -1 0 0; 0 0 0 1]; 

R1=A1(1:3,1:3);
R2=A2(1:3,1:3);
R3=A3(1:3,1:3);
R4=A4(1:3,1:3);

R0_4=R1*R2*R3*R4;
Rtr=transpose(R0_4)*Rn;

t4=atan2(sqrt(Rtr(1,3)^2+Rtr(2,3)^2),Rtr(3,3))
t3=atan2(Rtr(2,3)/sin(t4),Rt(1,3)/sin(t4))
t5=atan2(Rtr(3,2)/sin(t4), -Rtr(3,1)/sin(t4))

A5=[cos(t3) 0  -sin(t3)  0; sin(t3) 0 cos(t3) 0; 0 -1 0 0; 0 0 0 1]; 
A6=[cos(t4) 0 sin(t4) 0; sin(t4) 0 -cos(t4) 0; 0 1 0 0; 0 0 0 1];
A7=[cos(t5) -sin(t5) 0 0; sin(t5) cos(t5) 0 0; 0 0 1 d5; 0 0 0 1];    
    
    d0_1=A1*[0;0;0;1];
    d0_2=A1*A2*[0;0;0;1];
    d0_3=A1*A2*A3*[0;0;0;1];
	d0_4=A1*A2*A3*A4*[0;0;0;1];
    d0_5=A1*A2*A3*A4*A5*[0;0;0;1];
    d0_6=A1*A2*A3*A4*A5*A6*[0;0;0;1];
    d0_7=A1*A2*A3*A4*A5*A6*A7*[0;0;0;1];
    
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
    
     plot3 (x1,y1,z1 , x2,y2,z2 , x3,y3,z3, x4,y4,z4, x5,y5,z5, x6,y6,z6, x7,y7,z7)
     axis([-1.5 1.5 -1.5 1.5 0 1.5]) 
     grid on
    %hold off
  
    %4.1.10.2.4
%      plot (j, t1, 'b.')
%      hold on
%      plot (j, d2, 'm.')
%      hold on
%      plot (j, t2 , 'r.')
%      hold on
%      plot (j, t3 , 'k*')
%      hold on
%      plot (j, t4 , 'g+')
%      hold on
%      plot (j, t5 , 'cV')
%      hold on
%      xlabel('time [sec]')
%      ylabel('angel [rad] or length [m]')
%      legend ('t1','d2','t2','t3','t4','t5')
%      grid on
    
 %4.10....
%     Mg=5;  
%     tau=[0;Mg;-Mg*(a3*cos(t2)-d5*cos(t4)*sin(t2)+d5*cos(t2)*cos(t3)*sin(t4));Mg*d5*sin(t2)*sin(t3)*sin(t4); Mg*d5*(cos(t2)*sin(t4)+cos(t3)*cos(t4)*sin(t2)) ;0]
%     plot (j, tau(1), 'b.')
%     hold on
%     plot (j, tau(2), 'm.')
%     hold on
%     plot (j, tau(3) , 'r.')
%     hold on
%     plot (j, tau(4) , 'k*')
%     hold on
%     plot (j, tau(5) , 'g+')
%     hold on
%     plot (j, tau(6) , 'cV')
%     hold on
%     xlabel('time [sec]')
%     ylabel('Torues [Nm]')
%     legend ('t1','d2','t2','t3','t4','t5')
%     grid on
%    
  %  pause(0.3)
end
