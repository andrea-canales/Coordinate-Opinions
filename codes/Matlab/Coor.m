function R=Coor(IO,A,a,b,beta)

v=size(A,1);
FJ=[zeros(7,1),IO'];
%%%% Evolution  Friedkin and Johnsen %%%%
i=2;
while norm(FJ(:,i-1)-FJ(:,i),'inf')>0.03
    for j=1:7
    AUX(j)=a/(a+sum(A(j,:)))*IO(j)+1/(a+sum(A(j,:)))*dot(FJ(:,i),A(:,j));
    %AB=[FJ(:,i).*A(:,j)];
    %AUX(j)=median(AB(AB>0));
    end
FJ=[FJ,AUX'];
i=i+1;
end

%COSTFJ=a*abs(IO'-FJ(:,i));
COSTFJ=0.5*a*abs(IO'-FJ(:,i)).^b;
%COSTFJ=zeros(7,1);
for f=1:v
    for l=1:v
        COSTFJ(f)=0.5*A(f,l)*(FJ(f,i)-FJ(l,i))^b+COSTFJ(f);
    end
end


%%%% Evolution  Coordinated Opinions %%%%

CO=[zeros(7,1),IO'];
%s=mean([IO(3),IO(6),IO(7)]);
%[M,I]=min([s,1-s]);
%beta=I-1;

i=2;
CO(3,i)=beta;
CO(6,i)=beta;
CO(7,i)=beta;
while norm(CO(:,i-1)-CO(:,i),'inf')>0.03
    for j=1:7
    AUX(j)=a/(a+sum(A(j,:)))*IO(j)+1/(a+sum(A(j,:)))*dot(CO(:,i),A(:,j));
    %AB=[CO(:,i).*A(:,j)];
    %AUX(j)=median(AB(AB>0));
    end
    AUX(3)=beta;
    AUX(6)=beta;
    AUX(7)=beta;
CO=[CO,AUX'];
i=i+1;
end

%COSTCO=a*abs(IO'-CO(:,i));
COSTCO=0.5*a*abs(IO'-CO(:,i)).^b;
%COSTCO=zeros(7,1);
for f=1:v
    for l=1:v
        COSTCO(f)=0.5*A(f,l)*abs(CO(f,i)-CO(l,i))^b+COSTCO(f);
    end
end



%Result=[IO',FJ(:,i),CO(:,i)];


%%%% Incentives v=3 %%%
CO3=[zeros(7,1),IO'];
i=2;
CO3(6,i)=beta;
CO3(7,i)=beta;
while norm(CO3(:,i-1)-CO3(:,i),'inf')>0.03
    for j=1:7
    AUX(j)=a/(a+sum(A(j,:)))*IO(j)+1/(a+sum(A(j,:)))*dot(CO3(:,i),A(:,j));
    %AB=[CO3(:,i).*A(:,j)];
    %AUX(j)=median(AB(AB>0));
    end
    AUX(6)=beta;
    AUX(7)=beta;
CO3=[CO3,AUX'];
i=i+1;
end

COSTCO3=0.5*a*abs(IO'-CO3(:,i)).^b;
%COSTCO3=zeros(7,1);
for f=1:v
    for l=1:v
        COSTCO3(f)=0.5*A(f,l)*abs(CO3(f,i)-CO3(l,i))^b+COSTCO3(f);
    end
end

%%%% Incentives v=6 %%%
CO6=[zeros(7,1),IO'];
i=2;
CO6(3,i)=beta;
CO6(7,i)=beta;
while norm(CO6(:,i-1)-CO6(:,i),'inf')>0.03
    for j=1:7
    AUX(j)=a/(a+sum(A(j,:)))*IO(j)+1/(a+sum(A(j,:)))*dot(CO6(:,i),A(:,j));
    %AB=[CO6(:,i).*A(:,j)];
    %AUX(j)=median(AB(AB>0));
    end
    AUX(3)=beta;
    AUX(7)=beta;
CO6=[CO6,AUX'];
i=i+1;
end

COSTCO6=0.5*a*abs(IO'-CO6(:,i)).^b;
%COSTCO6=zeros(7,1);
for f=1:v
    for l=1:v
        COSTCO6(f)=0.5*A(f,l)*abs(CO6(f,i)-CO6(l,i))^b+COSTCO6(f);
    end
end

%%%% Incentives v=7 %%%
CO7=[zeros(7,1),IO'];
i=2;
CO7(3,i)=beta;
CO7(6,i)=beta;
while norm(CO7(:,i-1)-CO7(:,i),'inf')>0.03
    for j=1:7
    AUX(j)=a/(a+sum(A(j,:)))*IO(j)+1/(a+sum(A(j,:)))*dot(CO7(:,i),A(:,j));
    %AB=[CO7(:,i).*A(:,j)];
    %AUX(j)=median(AB(AB>0));
    end
    AUX(3)=beta;
    AUX(6)=beta;
CO7=[CO7,AUX'];
i=i+1;
end

COSTCO7=0.5*a*abs(IO'-CO7(:,i)).^b;
%COSTCO7=zeros(7,1);
for f=1:v
    for l=1:v
        COSTCO7(f)=0.5*A(f,l)*abs(CO7(f,i)-CO7(l,i))^b+COSTCO7(f);
    end
end

%R=[COSTFJ,COSTCO,COSTCO3,COSTCO6,COSTCO7];
E=0;
F=0;
if (COSTCO(3)<COSTCO3(3)) && (COSTCO(6)<COSTCO6(6)) && (COSTCO(7)<COSTCO7(7))
E=E+1;

else
  F=F+1;
 %[R(3,:);R(6,:);R(7,:)]
%end
end
R=E;

