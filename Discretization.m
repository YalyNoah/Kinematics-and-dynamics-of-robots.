%Discretization (4.1.5)
%the running takes a lot of time, we do not recommend running the loop.

%const
d1=0.5;
a2=0.3;
a3=0.25;
d5=0.15;

%Variable
t1 = linspace(0,2*pi,13);
d2 = linspace(0,0.5,8);
t2 = linspace(0,2*pi,8);
t3 = linspace(0,2*pi,8);
t4 = linspace(0.0001,pi-0.0001,8);
%t5 = linspace(0,2*pi,11); (Doesמ't matter(

%loop
i=1;
j=1;
k=1;
l=1;
m=1;


%Isometric
for i=1:12
    x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
    plot3(x,y,z,'b.');
    grid on
    hold on
    for j=1:7
        x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
     plot3(x,y,z,'b.');
        hold on
        for k=1:7
          x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
     plot3(x,y,z,'b.');
            hold on
            for l=1:7
                x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
    plot3(x,y,z,'b.');
                hold on
                for m=1:7
                   x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
     plot3(x,y,z,'b.');
                    hold on
                end
            end
        end 
   end
end        

%views
for i=1:13
    x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
    subplot(1,3,1)
    title ('x-y')
    plot(x,y, 'b.');
    grid on
    hold on
    subplot(1,3,2)
    title ('z-x')
    plot(z,x, 'b.');
    grid on
    hold on
    subplot(1,3,3)
    title ('z-y')
    plot(z,y, 'b.');
    grid on
    hold on
    for j=1:7
        x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
    subplot(1,3,1)
        plot(x,y, 'b.');
        subplot(1,3,2)
        plot(z,x, 'b.');
        subplot(1,3,3)
        plot(z,y, 'b.');
        hold on
        for k=1:7
            x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
    subplot(1,3,1)
            plot(x,y, 'b.');
            subplot(1,3,2)
            plot(z,x, 'b.');
            subplot(1,3,3)
            plot(z,y, 'b.');
            hold on
            for l=1:7
               x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
    subplot(1,3,1)
                plot(x,y, 'b.');
                subplot(1,3,2)
                plot(z,x, 'b.');
                subplot(1,3,3)
                plot(z,y, 'b.');
                hold on
                for m=1:7
                    x=cos(t1(i))*(a2 + a3*cos(t2(k))) + d5*(sin(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t1(i))*cos(t4(m))*sin(t2(k)) + cos(t1(i))*cos(t2(k))*cos(t3(l))*sin(t4(m)));
    y=sin(t1(i))*(a2 + a3*cos(t2(k))) - d5*(cos(t4(m))*sin(t1(i))*sin(t2(k)) + cos(t1(i))*sin(t3(l))*sin(t4(m)) - cos(t2(k))*cos(t3(l))*sin(t1(i))*sin(t4(m)));
    z=d1 + d2(j) - d5*(cos(t2(k))*cos(t4(m)) + cos(t3(l))*sin(t2(k))*sin(t4(m))) - a3*sin(t2(k));
    subplot(1,3,1)
                    plot(x,y, 'b.');
                    subplot(1,3,2)
                    plot(z,x, 'b.');
                    subplot(1,3,3)
                    plot(z,y, 'b.');
                    hold on
                end
            end
        end 
   end
end   
