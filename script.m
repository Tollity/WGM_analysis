clear
addpath('C:\Users\frank\OneDrive\Bureaublad\BSc assignment\Measurements\22-2 measurements')
%% import csv data from experiments
d10_50_1 = readtable("10ml-50rpm.csv");
d10_50_2 = readtable("10ml-50rpm2.csv");
d10_100_1 = readtable("10ml-100rpm.csv");
d10_100_2 = readtable("10ml-100rpm2.csv");
d20_50 = readtable("20ml-50rpm.csv");
d20_100 = readtable("20ml-100rpm.csv");
d30_50 = readtable("30ml-50rpm.csv");
d30_100 = readtable("30ml-50rpm.csv");
d37_5_50 = readtable("37_5ml-50rpm.csv");
d37_5_100 = readtable("37_5ml-100rpm.csv");
d50_50 = readtable("50ml-50rpm.csv");
d50_100 = readtable("50ml-100rpm.csv");
d75_50 = readtable("75ml-50rpm.csv");
d75_100 = readtable("75ml-100rpm.csv");
d100_50 = readtable("100ml-50rpm.csv");
d100_100 = readtable("100ml-100rpm.csv");
d112_5_50 = readtable("112_5ml-50rpm.csv");
d112_5_100 = readtable("112_5ml-100rpm.csv");
d150_50 = readtable("150ml-50rpm.csv");
d150_100 = readtable("150ml-100rpm.csv");
d0_50_0 = readtable("nofluid-50rpm0.csv");
d0_50_1 = readtable("nofluid-50rpm1.csv");
d0_50_2 = readtable("nofluid-50rpm2.csv");
d0_100_1 = readtable("nofluid-100rpm1.csv");
d0_100_2 = readtable("nofluid-100rpm2.csv");
empty_1 = readtable("nobeads_NoFluid_1.csv");
empty_2 = readtable("nobeads_NoFluid_2.csv");
%% combining all data in one table, as well as one table that has the names of the data

Enames = ["d10_50_1" , "d10_50_2" , "d10_100_1" , "d10_100_2" , "d20_50" , "d20_100" , "d30_50" , "d30_100" , "d37_5_50" , "d37_5_100", "d50_50" , "d50_100" ,"d75_50" ,"d75_100" , "d100_50" , "d100_100" , "d112_5_50" , "d112_5_100" , "d150_50" , "d150_100" , "d0_50_0" , "d0_50_1" , "d0_50_2" , "d0_100_1" ,  "d0_100_2" , "empty_1" , "empty_2"];
E = {d10_50_1 , d10_50_2 , d10_100_1 , d10_100_2 , d20_50 , d20_100 , d30_50 , d30_100 , d37_5_50 , d37_5_100, d50_50 , d50_100 ,d75_50 ,d75_100 , d100_50 , d100_100 , d112_5_50 , d112_5_100 , d150_50 , d150_100 , d0_50_0 , d0_50_1 , d0_50_2 , d0_100_1 ,  d0_100_2 , empty_1, empty_2};

Eemtpynames = ["empty_1" , "emtpy_2"];
E_emtpy= {empty_1,empty_2};
%% Calculating gram-force into Newton and adding it to the table E in 2 new columns
%  The tables in Cell E now have extra column with the Force in Newtons in it
newtontext = "Newton (N)";

for k = 1:numel(E)
   E{k}.Var6(:) = newtontext;
   E{k}.Var7(:) = E{k}.Var4 * 0.00981;
end

%% plotting all data in seperate figures, saving without displaying - grams

% for k = 1:numel(E)
%     T=(E(k));
%     T_time=T{1}(:,2);
%     T_value=T{1}(:,4);
%     filename=Enames(k);
%     f=figure('visible','off');
%     plot(T_time{:,1},T_value{:,1});
%     title('Grams over time');
%     xlabel('Time (ms)');
%     ylabel('Grams (g)');
%     saveas(f,filename + ' grams-time','jpg');
% end

%% plotting all data in seperate figures, saving without displaying - newtons

% for k = 1:numel(E)
%     T=(E(k));
%     T_time=T{1}(:,2);
%     T_value=T{1}(:,7);
%     filename=Enames(k);
%     f=figure('visible','off');
%     plot(T_time{:,1},T_value{:,1});
%     title('Newtons over time');
%     xlabel('Time (ms)');
%     ylabel('Force (N)');
%     saveas(f,filename + ' Newton-time','jpg');
% end


%% Plotting all data in one figure - grams

% hold on
% figure('visible','on','Name',"all data");hold on
% for k = 1:numel(E)
%     T=(E(k));
%     T_time=T{1}(:,2);
%     T_value=T{1}(:,4);
%     plot(T_time{:,1},T_value{:,1});
%     title('Grams over time');
%     xlabel('Time (ms)');
%     ylabel('Grams (g)');
% end
% hold off
%% Plotting all data in one figure - Newtons

% hold on
% figure('visible','on','Name',"all data");hold on
% for k = 1:numel(E)
%     T=(E(k));
%     T_time=T{1}(:,2);
%     T_value=T{1}(:,4);
%     plot(T_time{:,1},T_value{:,1});
%     title('Force over time');
%     xlabel('Time (ms)');
%     ylabel('Force (N)');
% end
% hold off

%% Avg force of data sets from range cell 100-1000 to cut out initial and final unloaded values , last 2 data sets excluded (the empty_1 and empty_2 sets, they are too short)
totalvolcylinder = 750; % ml
voidfraction = 0.375; 
Evolumes = [10 10 10 10 20 20 30 30 37.5 37.5 50 50 75 75 100 100 112.5 112.5 150 150 0 0 0 0 0];

for k = 1:numel(E)-2
    name = char(Enames(k));
    avg_newton = mean(E{k}{100:1000,7});
    stdev = std(table2array(E{k}(100:1000,7)));
    SDOM = stdev/sqrt(length(100:1000));
    volumepercentage = ( Evolumes(k) / 750 )*100 / 0.375;
    avg_per_msrmnt(k,:)=table(avg_newton,Enames(k),stdev,SDOM,volumepercentage);
    
end

%% Getting errors for errorbars


%% Splitting the values into 100 motor rpm and 50 motor rpm sets.

val50inE = [1 2 5 7 9 11 13 15 17 19 22 23];%skipped 21
val100inE = [3 4 6 8 10 12 14 16 18 20 24 25];
l50 = numel(val50inE);
l100 = numel(val100inE);

% 3rd column will represent the volume% of the void volume in the packed
% spheres in the drum. Close random packing is assumed because of the
% rotations, this has a void fraction  of 0.359-0.375 https://en.wikipedia.org/wiki/Random_close_pack#For_spheres
l50vals = avg_per_msrmnt(val50inE,1);
l50vals(:,2)=avg_per_msrmnt(val50inE,2);
l50vals(:,3)=avg_per_msrmnt(val50inE,4);
l50vals(:,4)=avg_per_msrmnt(val50inE,5);
l50vals.Properties.VariableNames = ["avg_newton", "name" , "SDOM" , "vol%"];

% l50volumes= [10 10 20 30 37.5 50 75 100 112.5 150 0 0 0];
% totalvolcylinder = 750; % ml
% voidfraction = 0.375; 
% l50vals(:,3)=l50volumes(1,:) /750 * 0.375;

l100vals = avg_per_msrmnt(val100inE,1);
l100vals(:,2)=avg_per_msrmnt(val100inE,2);
l100vals(:,3)=avg_per_msrmnt(val100inE,4);
l100vals(:,4)=avg_per_msrmnt(val100inE,5);
l100vals.Properties.VariableNames = ["avg_newton", "name" , "SDOM" , "vol%"];

figure()
 y50 = l50vals.avg_newton;
 x50 = l50vals.("vol%");
 SDOM50 = l50vals.SDOM;
 errorbar(x50,y50,SDOM50,'o', 'LineWidth', 1.5, 'MarkerEdgeColor', 'black');
xlabel('Void volume fill %');
ylabel('Avg. Force [N]');
title('Average F(V%)-plotted for 1.76 RPM');
grid on;

figure()
 y100 = l100vals.avg_newton;
 x100 = l100vals.("vol%");
 SDOM100 = l100vals.SDOM;
  errorbar(x100,y100,SDOM100,'o', 'LineWidth', 1.5, 'MarkerEdgeColor', 'black');
xlabel('Void volume fill %');
ylabel('Avg. Force [N]');
title('Average F(V%)-plotted for 3.52 RPM');
grid on;

%% Plotting all data in one figure - Newtons 50rpm & 100rpm

hold on
figure('visible','on','Name',"all data");hold on
for k = 1:numel(val50inE)
    T=(E(val50inE(k)));
    T_time=T{1}(:,2);
    T_value=T{1}(:,4);
    plot(T_time{:,1},T_value{:,1});
    title('Force over time 1.76 rpm');
    xlabel('Time (ms)');
    ylabel('Force (N)');
end
hold off

hold on
figure('visible','on','Name',"all data");hold on
for k = 1:numel(val100inE)
    T=(E(val100inE(k)));
    T_time=T{1}(:,2);
    T_value=T{1}(:,4);
    plot(T_time{:,1},T_value{:,1});
    title('Force over time 2.52 rpm');
    xlabel('Time (ms)');
    ylabel('Force (N)');
end
hold off
