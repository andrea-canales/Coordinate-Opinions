%%%%% Cordinated opinions %%%%%%
%G=int16.empty(7,0);
E=0;
F=0;
S=zeros(8,1);
NS=zeros(8,1);
RE=zeros(3,1);
for h=1:1000
%%%% Initial Opininions %%%%
IO(1)=rand;
IO(2)=rand;
IO(3)=rand;
IO(4)=rand;
IO(5)=rand;
IO(6)=rand;
IO(7)=rand;

a=0.1;
b=2;
%beta=0;

%%%% Neighbours %%%%
deg=[3;2;3;2;2;3;3];
B=zeros(7,7);
B(1,2)=1;
B(1,4)=1;
B(1,5)=1;
B(2,6)=1;
B(3,4)=1;
B(3,6)=1;
B(3,7)=1;
B(5,7)=1;
B(6,7)=1;
A=B+B';


R1=Coor(IO,A,a,b,0);
R2=Coor(IO,A,a,b,0.5);
R3=Coor(IO,A,a,b,1);
RE=[RE,[R1;R2;R3]];
end
sum(sum(RE))