function res = evalIntervals(filename)

I = importdata(filename);
dvs = I(:,1:2);
ptam = I(:,3:4);
flip = I(:,5:6);

I_dvs = dvs(:,2) - dvs(:,1);
I_ptam = ptam(:,2) - ptam(:,1);
I_flip = flip(:,2) - flip(:,1);

mean_dvs_start = mean(dvs(:,1) - flip(:,1));
mean_ptam_start = mean(ptam(:,1) - flip(:,1));

mean_dvs_I = mean(I_dvs);
sd_dvs = std(I_dvs);
mean_ptam_I = mean(I_ptam);
sd_ptam = std(I_ptam);
mean_flip_I = mean(I_flip);
sd_flip = std(I_flip);

res = [mean_dvs_I sd_dvs;
    mean_ptam_I sd_ptam;
    mean_flip_I sd_flip];

%plot
boxplot([I_dvs I_ptam I_flip],'labels',{'Tracking lost DVS ','Tracking lost PTAM ' ,'Flip time'});
title('Tracking downtime','FontSize',12,'FontWeight','bold');
ylabel('Time [s]','Rotation',90);

figure;

time_data = [0 mean_flip_I;
    mean_ptam_start mean_ptam_I;
    mean_dvs_start mean_dvs_I];

h = barh(time_data,0.4,'stack');
title('Mean tracking downtime comparison','FontSize',12,'FontWeight','bold');
xlabel('Time [s]');

child = get(h(2),'Children');
set(child,'CData',[1 2 3]);
mycolor=[0.7 0.2 0.2;0.2 0.4 0.7;0.2 0.7 0.2];
colormap(mycolor);

set(h(1), 'facecolor', 'none', 'EdgeColor', 'none'); % disable the color of the first column (init time)
set(gca, 'YTickLabel', {'Flip duration', 'PTAM', 'DVS'}); % change the y axis tick to your name of the process


