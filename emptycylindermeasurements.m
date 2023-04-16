empty1 = readtable("nobeads_NoFluid_1.csv");
empty2 = readtable("nobeads_NoFluid_2.csv");

%empty1= emtpy_1(:,4) * 0.00981;
empty1force= 0.00981 * empty1{:,4};
empty1total = [empty1, array2table(empty1force)];
empty2force= 0.00981 * empty2{:,4};
empty2total = [empty2, array2table(empty2force)];

figure()
plot(empty1total{:,2},empty1total{:,6});
xlabel('time [ms]');
ylabel('Force [N]');
title(['F(t) empty measurement 1']);
grid on;

figure()
plot(empty2total{:,2},empty2total{:,6});
xlabel('time [ms]');
ylabel('Force [N]');
title('F(t) empty measurement 2');
grid on;

std1 = std(empty1force(36:407));
std2 = std(empty2force(42:418));
avg1= mean(empty1force(36:407));
avg2= mean(empty2force(42:418));
SDOM1= std1/sqrt(length(empty1force(36:407)));
SDOM2= std2/sqrt(length(empty2force(42:418)));