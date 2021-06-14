%motion planning (only location, the Rotation is in the simulation)

%Setting times and constant
T=15;  %Total time
t_1=T/3; 
t_2=(2*T)/3;
ac=1/(0.5*t_1^2+t_1*(t_2-t_1)+0.5*(2*t_1-(T-t_2))*(T-t_2)); %acceleration
ds=[0;1;1] %Starting position
dg=[1;1;1.5] %Final locatioמ


for t=0:T
    
if 0<=t && t<t_1 %acceleration
s=0.5*ac*t^2;
v=ac*t;
a=ac;

else
    if t_1<=t && t<=t_2 %constant velocity
    s=0.5*ac*t_1^2+ac*t_1*(t-t_1);
    v=ac*t_1;
    a=0;
    
    else
        if t_2<t && t<=T %deceleration
    s=0.5*ac*t_1^2+ac*t_1*(t_2-t_1)+0.5*(t-t_2)*(2*ac*t_1-ac*(t-t_2));
    v=ac*t_1-ac*(t-t_2);
    a=-ac;
        end
        end
    end


d_t=ds+s*(dg-ds); %Location as a function of time
v_t=v*(dg-ds); %velocity as a function of time
v_tSize=sqrt(v_t(1)^2+v_t(2)^2+v_t(3)^2);

%trapeze (4.1.9.4)
subplot(2,1,1)
plot(t,v_tSize , 'b.') 
axis ([0 15  0 0.15])
xlabel('t')
ylabel('v')
grid on
hold on
%points along the route (4.1.9.3)
subplot(2,1,2)
plot3(d_t(1), d_t(2), d_t(3), 'r.')
xlabel('x')
ylabel('y')
zlabel('z')
hold on

end
grid on
