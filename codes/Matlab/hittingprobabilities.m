P=zeros(11,11);
P(1,2)=1/4;
P(1,4)=1/4;
P(1,5)=1/4;
P(1,8)=1/4;
P(2,1)=1/3;
P(2,6)=1/3;
P(2,10)=1/3;
P(3,4)=1/3;
P(3,6)=1/3;
P(3,7)=1/3;
P(4,1)=1/3;
P(4,3)=1/3;
P(4,10)=1/3;
P(5,1)=1/3;
P(5,7)=1/3;
P(5,11)=1/3;
P(6,2)=1/3;
P(6,3)=1/3;
P(6,7)=1/3;
P(7,3)=1/3;
P(7,5)=1/3;
P(7,6)=1/3;
P(8,1)=1;
P(9,2)=1;
P(10,4)=1;
P(11,5)=1;

[ns ms]=size(P);
n=ns;
while n>1
n1=n-1;
s=sum(P(n,1:n1));
P(1:n1,n)=P(1:n1,n)/s;
n2=n1;
while n2>0
P(1:n1,n2)=P(1:n1,n2)+P(1:n1,n)*P(n,n2);
n2=n2-1;
end
n=n-1;
end
%backtracking
p(1)=1;
j=2;
while j<=ns
j1=j-1;
p(j)=sum(p(1:j1).*(P(1:j1,j))');
j=j+1;
end
p=p/(sum(p));