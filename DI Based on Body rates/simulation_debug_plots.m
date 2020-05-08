parameters;

mkdir('Plots - Normal')
% Position 
% figure(1)
a = figure('visible','off')
subplot(3,1,1)
plot(t,X(1,:),'r','LineWidth',2)
hold on
plot(t,Xd(1,:),'--b','LineWidth',3.5)

set(gca,'FontSize',15);
hTitle =title(' POSITION TRACKING ');
set(hTitle,'FontSize',17.5);

xlabel('Time (s)') % x-axis label
ylabel('X (m)') % y-axis label
% legend('Current state (sensor feed)',' Desired trajectory');
grid on;

subplot(3,1,2)
plot(t,X(2,:),'r','LineWidth',2)
hold on
plot(t,Xd(2,:),'--b','LineWidth',3.5)
% hTitle = title('Y- Instantaneous current and desired position');
set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('Y (m)') % y-axis label
% legend('Current state (sensor feed)',' Desired trajectory');
grid on;

subplot(3,1,3)
plot(t,X(3,:),'r','LineWidth',2)
hold on
plot(t,Xd(3,:),'--b','LineWidth',3.5)
% hTitle = title('Z- Instantaneous current and desired position');
set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('Z (m)') % y-axis label
legend('Current state',' Desired trajectory');
grid on;

saveas(a,'Plots - Normal/Position_DI','jpg');
saveas(a,'Plots - Normal/Position_DI','epsc');
saveas(a,'Plots - Normal/Position_DI','pdf');
% Attitude
% figure(2)
b = figure('visible','off')
subplot(3,1,1)
plot(t,X(4,:)*(180/pi),'r','LineWidth',2)
hold on
plot(t,Xd(4,:)*180/pi,'--b','LineWidth',3.5)
% hTitle = title('\Phi - Instantaneous current and desired ');
set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
hTitle = title(' ATTITUDE TRACKING ');
set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('\Phi^o') % y-axis label
% legend('Current state  ',' Desired trajectory');
grid on;

subplot(3,1,2)
plot(t,X(5,:)*180/pi,'r','LineWidth',2)
hold on
plot(t,Xd(5,:)*180/pi,'--b','LineWidth',3.5)
% hTitle = title('\Theta -  Instantaneous current and desired');
set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('\Theta^o') % y-axis label
% legend(' Current state  ',' Desired trajectory');
grid on;

subplot(3,1,3)
plot(t,X(6,:)*180/pi,'r','LineWidth',2)
hold on
plot(t,Xd(6,:)*180/pi,'--b','LineWidth',3.5)
% hTitle = title('\Psi -  Instantaneous current and desired');
set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('\Psi^o') % y-axis label
legend(' Current state  ',' Desired trajectory');
grid on;

saveas(b,'Plots - Normal/Attitude_DI','jpg');
saveas(b,'Plots - Normal/Attitude_DI','epsc');
saveas(b,'Plots - Normal/Attitude_DI','pdf');

% figure(3)
c = figure('visible','off')
subplot(2,2,1)
plot(t(:,1:N-1),(U(1,:)./9.81)*1000,'r','LineWidth',2)

% hTitle =  title(' Thrust ');
set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
% hTitle =  title(' CONTROL INPUTS ');
% set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('Thrust (g)') % y-axis label
grid on;

subplot(2,2,2)
plot(t(:,1:N-1),(U(2,:)./9.81)*1000,'r','LineWidth',2)
% hTitle =title('Rolling moment');
set(gca,'FontSize',15);
% set(hTitle,'FontSize',15);
xlabel('Time (s)') % x-axis label
ylabel('Rolling Moment (g-m)') % y-axis label
grid on;

subplot(2,2,3)
plot(t(:,1:N-1),(U(3,:)./9.81)*1000,'r','LineWidth',2)
%  hTitle =title('Pitching moment');
 set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('Pitching Moment (g-m)') % y-axis label
grid on;

subplot(2,2,4)
plot(t(:,1:N-1),(U(4,:)./9.81)*1000,'r','LineWidth',2)
%  hTitle =title('Yawing moment');
 set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
xlabel('Time (s)') % x-axis label
ylabel('Yawing Moment (g-m)') % y-axis label
grid on;

% hTitle =  title(' CONTROL INPUTS ');
% set(hTitle,'FontSize',17.5);
axes('Position',[0 0 1 1],'Visible','off');
text(0.45,0.95,'CONTROL INPUT','FontSize',17.5)

saveas(c,'Plots - Normal/Controls_DI','jpg');
saveas(c,'Plots - Normal/Controls_DI','epsc');
saveas(c,'Plots - Normal/Controls_DI','pdf');

% figure(4)
d = figure('visible','off')
plot3(X(1,:),X(2,:),X(3,:),'r','LineWidth',2)
hold on
plot3(Xd(1,:),Xd(2,:),Xd(3,:),'--b','LineWidth',3.5)
% hTitle =title('Instantaneous current and desired position');
plotbrowser('off')
 set(gca,'FontSize',15);
% set(hTitle,'FontSize',17.5);
hTitle =title('POSITION TRACKING');
set(hTitle,'FontSize',17.5);
xlabel('X (m)') % x-axis label
ylabel('Y (m)') % y-axis label
zlabel('Z (m)') % z-axis label
legend(' Current state  ',' Desired trajectory');
grid on;

saveas(d,'Plots - Normal/Position_3d_DI','jpg');
saveas(d,'Plots - Normal/Position_3d_DI','epsc');
saveas(d,'Plots - Normal/Position_3d_DI','pdf');

% % % % % % % % % % % % % % % figure(5)
% % % % % % % % % % % % % % % hTitle =title('ATTITUDE TRACKING');
% % % % % % % % % % % % % % % set(hTitle,'FontSize',17.5);
% % % % % % % % % % % % % % % plot3(X(4,:)*180/pi,X(5,:)*180/pi,X(6,:)*180/pi,'r','LineWidth',2)
% % % % % % % % % % % % % % % hold on
% % % % % % % % % % % % % % % plot3(Xd(4,:)*180/pi,Xd(5,:)*180/pi,Xd(6,:)*180/pi,'--b','LineWidth',3.5)
% % % % % % % % % % % % % % % % hTitle =title('Instantaneous current and desired position');
% % % % % % % % % % % % % % % % set(gca,'FontSize',15);
% % % % % % % % % % % % % % % % set(hTitle,'FontSize',17.5);
% % % % % % % % % % % % % % % xlabel('\Phi^o') % x-axis label
% % % % % % % % % % % % % % % ylabel('\Theta^o') % y-axis label
% % % % % % % % % % % % % % % zlabel('\Psi^o') % z-axis label
% % % % % % % % % % % % % % % legend(' Current state  ',' Desired trajectory');
% % % % % % % % % % % % % % % grid on;