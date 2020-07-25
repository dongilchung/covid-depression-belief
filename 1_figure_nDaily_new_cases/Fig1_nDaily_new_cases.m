% fig.1a 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n of covid patients in Korea

% !survey period!
% Time1: 4/14/2020 ~ 4/20/2020
% Time2: 5/21/2020 ~ 5/28/2020 

% data: https://coronaboard.kr/
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 2-sample t-test
nPatientTime1=[30 32 25 27 27 22 22 18 8 13 9 11 8];
nPatientTime2=[15 13 32 12 20 23 25 16 19 40 79 58 39 27];
[h,p,ci,stats] = ttest2(nPatientTime1,nPatientTime2)

% slope
stats=regstats(zscore(nPatientTime1(4:10)'),zscore(1:7)')
stats=regstats(zscore(nPatientTime2(4:11))',zscore(1:8)')

%% plot
nMarch=[104 91 146 105 78 125];
nApril=[101 89 86 94 81 47 47 53 39 27 30 32 25 27 27 22 22 18 8 13 9 11 8 6 10 10 10 14 9 4];
nMay=[9 6 13 8 3 2 4 12 18 34 35 27 26 29 27 19 13 15 13 32 12 20 23 25 16 19 40 79 58 39 27];
nJune=[35 38 49 39 39 51 57 38 38 50 45 56 48 33 37 34 43 59 49 67];

% survey period
figure('color','w'); hold on;
data=[nApril nMay nJune];

% a= blue bar; b= red bar 
a=bar(data,'FaceColor',[147 177 189]./225,'EdgeColor','none'); 
a.FaceAlpha=0.5;
data(setdiff(1:length(data),([11:23 48:61])))=0;
b=bar(data,'FaceColor',[0.6350, 0.0780, 0.1840],'EdgeColor','none'); 
b.FaceAlpha=0.5;

xticks([5 15 25 35 45 55 66 76]); yticks(0:20:120);
xticklabels({'Apr5','Apr15','Apr25','May5','May15','May25','Jun5','Jun15'});
set(gca,'linewidth',3,'fontsize',25)

% average 7 days: gray line
data_7win=[];
data7=[nMarch nApril nMay nJune];
for idx=7:length(data7)
    data_7win(idx-6)=mean(data7(idx-6:idx));
end
plot(data_7win,'color',[0.8 0.8 0.8],'lineWidth',4);
