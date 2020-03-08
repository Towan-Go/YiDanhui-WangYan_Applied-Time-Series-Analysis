data a;
x_1=0;
y_1=0;
z_1=0;
e_1=0;
do t=-100 to 1000;
e=rannor(12345);
x=0.8*x_1+e;
y=e+0.7*e_1;
z=0.8*z_1+e+0.7*e_1;
x_1=x;
y_1=y;
z_1=z;
e_1=e;
if t>0 then output ;
end;
data a;
set a;
keep t x y z;
run;
proc arima data=a;
identify var=x nlag=20 outcov=out1;
identify var=y nlag=20 outcov=out2;
identify var=z nlag=20 outcov=out3;
run;
symbol c=red i=needle v=none;
proc gplot data=out1;
plot corr*lag partcorr*lag;
proc gplot data=out2;
plot corr*lag partcorr*lag;
proc gplot data=out3;
plot corr*lag partcorr*lag;
run;