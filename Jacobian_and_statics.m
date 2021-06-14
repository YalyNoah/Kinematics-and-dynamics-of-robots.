%Jacobian and statics (4.1.7, 4.1.8)

%Variable and constant
syms t1 t2 t3 t4 t5; 
syms d1 d2 a2 a3 d5;

    %transformation matrix 
    A1=[cos(t1) -sin(t1) 0 0 ; sin(t1) cos(t1) 0 0; 0 0 1 d1; 0 0 0 1];
    A2=[1 0 0 0; 0 1 0 0; 0 0 1 d2; 0 0 0 1];
    A3=[1 0 0 a2; 0 0 1 0; 0 -1 0 0; 0 0 0 1];   
    A4=[cos(t2) 0 -sin(t2) a3*cos(t2); sin(t2) 0 cos(t2) a3*sin(t2); 0 -1 0 0; 0 0 0 1]; 
    A5=[cos(t3) 0  -sin(t3)  0; sin(t3) 0 cos(t3) 0; 0 -1 0 0; 0 0 0 1]; 
    A6=[cos(t4) 0 sin(t4) 0; sin(t4) 0 -cos(t4) 0; 0 1 0 0; 0 0 0 1];
    A7=[cos(t5) -sin(t5) 0 0; sin(t5) cos(t5) 0 0; 0 0 1 d5; 0 0 0 1];    
    An=A1*A2*A3*A4*A5*A6*A7;
    
    %transformation rotation matrix 
    R1=A1(1:3,1:3);
    R2=A2(1:3,1:3);
    R3=A3(1:3,1:3);
    R4=A4(1:3,1:3);
    R5=A5(1:3,1:3);
    R6=A6(1:3,1:3);
    R7=A7(1:3,1:3);
    Rn=simplify(R1*R2*R3*R4*R5*R6*R7);
    
    %Location vector
    d0_1=(A1*[0;0;0;1]);
    d0_2=(A1*A2*[0;0;0;1]);
    d0_3=(A1*A2*A3*[0;0;0;1]);
    d0_4=(A1*A2*A3*A4*[0;0;0;1]);
    d0_5=(A1*A2*A3*A4*A5*[0;0;0;1]);
    d0_6=(A1*A2*A3*A4*A5*A6*[0;0;0;1]);
    d0_7=(A1*A2*A3*A4*A5*A6*A7*[0;0;0;1]);
    dn=d0_7(1:3);
    
%Jacobian (4.1.7)

    %T1 Jacobian (Rotary joint) (First degree of freedom) 
    b0=[0;0;1]; 
    r0e=dn; 
    br0=simplify(cross(b0,r0e)); 
    c0=diff(dn,t1); %Numerical test
    br0-c0; %If the result is zero it's true
   
    %d2 Jacobian (Linear joint)
    b1=(R1*[0;0;1]);
    c1=diff(dn,d2);
    b1-c1;
    
    %constant joint  
    b2=(R1*R2*[0;0;1]);
    r2e=(dn-d0_2(1:3));
    br2=simplify(cross(b2,r2e));
    c2=diff(dn,t1);
    br2-c2;
    
    %T2 Jacobian (Rotary joint)
    b3=(R1*R2*R3*[0;0;1]);
    r3e=(dn-d0_3(1:3));
    br3=simplify(cross(b3,r3e));
    c3=simplify(diff(dn,t2));
    simplify(br3-c3);
    
    %T3 Jacobian (Rotary joint)
    b4=(R1*R2*R3*R4*[0;0;1]);
    r4e=(dn-d0_4(1:3));
    br4=simplify(cross(b4,r4e));
    c4=simplify(diff(dn,t3));
    simplify(br4-c4);
    
    %T4 Jacobian (Rotary joint)
    b5=(R1*R2*R3*R4*R5*[0;0;1]);
    r5e=(dn-d0_5(1:3));
    br5=simplify(cross(b5,r5e));
    c5=simplify(diff(dn,t4));
    simplify(br5-c5);
    
    %T5 Jacobian (Rotary joint)
    b6=(R1*R2*R3*R4*R5*R6*[0;0;1]);
    r6e=(dn-d0_6(1:3));
    br6=simplify(cross(b6,r6e));
    cc6=simplify(diff(dn,t5));
    simplify(br6-cc6);
    
    %Rotary Jacobian 
    JL=[br0, b1, br2, br3, br4, br5, br6];
    %Linear Jacobiaמ
    JA=[b0,[0;0;0],b2,b3,b4,b5,b6];
    %The Jacobiaמ
    J=simplify([JL;JA])

%statics (4.1.8)

    %const
    syms Mg %the force
    F=[0;0;-Mg]; %forces
    T=[0;0;0]; %Torques
    tau=-simplify(transpose(J)*[F;T]) %Vector forces for each joint

