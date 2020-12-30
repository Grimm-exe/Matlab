function acelerometro_arduino()
delete(instrfind({'Port'},{'COM5'}));
s = serial ('COM5');
set (s, 'BaudRate', 9600);
fopen (s);
hold on
SR = 0.16;
i = 10;
while (1)
 str = fscanf(s);
index3 = find(str == 'a');
str2 = str(index3+1:end);
Ax(i) = str2double(str2);
subplot(2,1,1),title('Accelerometer XYZ Axis Average Scaled Data'),ylim([0.4
1.6]),xlabel('Time(s)'),ylabel('Acc (G)');
set(gca,'YTick',[0.4 0.6 0.8 1.0 1.2 1.4 1.6])
grid on

plot(SR.*(i-5:i),Ax(i-5:i),'--r','LineWidth',2);


hold on
if (rem (i,200) == 0)
 close;
end
i=i+1;
drawnow;
end
end