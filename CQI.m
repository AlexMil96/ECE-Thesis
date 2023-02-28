function [cqi,modulation_order,coding_rate,cqisum]=CQI(sinr1,sinr2,UEspercell,totaleNBs,tti,cqisum)
    
    %% dedomena1
% LTE_config.CQI_params(1).CQI = 1;
% LTE_config.CQI_params(1).modulation = 'QPSK';
% LTE_config.CQI_params(1).modulation_order = 2;
% LTE_config.CQI_params(1).coding_rate_x_1024 = 78;
% LTE_config.CQI_params(1).efficiency = 0.1523;
% 
% LTE_config.CQI_params(2).CQI = 2;
% LTE_config.CQI_params(2).modulation = 'QPSK';
% LTE_config.CQI_params(2).modulation_order = 2;
% LTE_config.CQI_params(2).coding_rate_x_1024 = 120;
% LTE_config.CQI_params(2).efficiency = 0.2344;
% 
% LTE_config.CQI_params(3).CQI = 3;
% LTE_config.CQI_params(3).modulation = 'QPSK';
% LTE_config.CQI_params(3).modulation_order = 2;
% LTE_config.CQI_params(3).coding_rate_x_1024 = 193;
% LTE_config.CQI_params(3).efficiency = 0.3770;
% 
% LTE_config.CQI_params(4).CQI = 4;
% LTE_config.CQI_params(4).modulation = 'QPSK';
% LTE_config.CQI_params(4).modulation_order = 2;
% LTE_config.CQI_params(4).coding_rate_x_1024 = 308;
% LTE_config.CQI_params(4).efficiency = 0.6016;
% 
% LTE_config.CQI_params(5).CQI = 5;
% LTE_config.CQI_params(5).modulation = 'QPSK';
% LTE_config.CQI_params(5).modulation_order = 2;
% LTE_config.CQI_params(5).coding_rate_x_1024 = 449;
% LTE_config.CQI_params(5).efficiency = 0.8770;
% 
% LTE_config.CQI_params(6).CQI = 6;
% LTE_config.CQI_params(6).modulation = 'QPSK';
% LTE_config.CQI_params(6).modulation_order = 2;
% LTE_config.CQI_params(6).coding_rate_x_1024 = 602;
% LTE_config.CQI_params(6).efficiency = 1.1758;
% 
% LTE_config.CQI_params(7).CQI = 7;
% LTE_config.CQI_params(7).modulation = '16QAM';
% LTE_config.CQI_params(7).modulation_order = 4;
% LTE_config.CQI_params(7).coding_rate_x_1024 = 378;
% LTE_config.CQI_params(7).efficiency = 1.4766;
% 
% LTE_config.CQI_params(8).CQI = 8;
% LTE_config.CQI_params(8).modulation = '16QAM';
% LTE_config.CQI_params(8).modulation_order = 4;
% LTE_config.CQI_params(8).coding_rate_x_1024 = 490;
% LTE_config.CQI_params(8).efficiency = 1.9141;
% 
% LTE_config.CQI_params(9).CQI = 9;
% LTE_config.CQI_params(9).modulation = '16QAM';
% LTE_config.CQI_params(9).modulation_order = 4;
% LTE_config.CQI_params(9).coding_rate_x_1024 = 616;
% LTE_config.CQI_params(9).efficiency = 2.4063;
% 
% LTE_config.CQI_params(10).CQI = 10;
% LTE_config.CQI_params(10).modulation = '64QAM';
% LTE_config.CQI_params(10).modulation_order = 6;
% LTE_config.CQI_params(10).coding_rate_x_1024 = 466;
% LTE_config.CQI_params(10).efficiency = 2.7305;
% 
% LTE_config.CQI_params(11).CQI = 11;
% LTE_config.CQI_params(11).modulation = '64QAM';
% LTE_config.CQI_params(11).modulation_order = 6;
% LTE_config.CQI_params(11).coding_rate_x_1024 = 567;
% LTE_config.CQI_params(11).efficiency = 3.3223;
% 
% LTE_config.CQI_params(12).CQI = 12;
% LTE_config.CQI_params(12).modulation = '64QAM';
% LTE_config.CQI_params(12).modulation_order = 6;
% LTE_config.CQI_params(12).coding_rate_x_1024 = 666;
% LTE_config.CQI_params(12).efficiency = 3.9023;
% 
% LTE_config.CQI_params(13).CQI = 13;
% LTE_config.CQI_params(13).modulation = '64QAM';
% LTE_config.CQI_params(13).modulation_order = 6;
% LTE_config.CQI_params(13).coding_rate_x_1024 = 772;
% LTE_config.CQI_params(13).efficiency = 4.5234;
% 
% LTE_config.CQI_params(14).CQI = 14;
% LTE_config.CQI_params(14).modulation = '64QAM';
% LTE_config.CQI_params(14).modulation_order = 6;
% LTE_config.CQI_params(14).coding_rate_x_1024 = 873;
% LTE_config.CQI_params(14).efficiency = 5.1152;
% 
% LTE_config.CQI_params(15).CQI = 15;
% LTE_config.CQI_params(15).modulation = '64QAM';
% LTE_config.CQI_params(15).modulation_order = 6;
% LTE_config.CQI_params(15).coding_rate_x_1024 = 948;
% LTE_config.CQI_params(15).efficiency = 5.5547;

    %% dedomena2
%             if TB_SINR_dB<-5.147
%                 assigned_CQI=1;
%                 modulation_order=2;
%                 coding_rate=78;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=-5.147 && TB_SINR_dB<-3.18
%                 assigned_CQI=2;
%                 modulation_order=2;
%                 coding_rate=120;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=-3.18 && TB_SINR_dB<-1.254
%                 assigned_CQI=3;
%                 modulation_order=2;
%                 coding_rate=193;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=-1.254 && TB_SINR_dB<0.761
%                 assigned_CQI=4;
%                 modulation_order=2;
%                 coding_rate=308;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=0.761 && TB_SINR_dB<2.70
%                 assigned_CQI=5;
%                 modulation_order=2;
%                 coding_rate=449;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=2.70 && TB_SINR_dB<4.697
%                 assigned_CQI=6;
%                 modulation_order=2;
%                 coding_rate=602;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=4.697 && TB_SINR_dB<6.528
%                 assigned_CQI=7;
%                 modulation_order=4;
%                 coding_rate=378;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=6.528 && TB_SINR_dB<8.576
%                 assigned_CQI=8;
%                 modulation_order=4;
%                 coding_rate=490;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=8.576 && TB_SINR_dB<10.37
%                 assigned_CQI=9;
%                 modulation_order=4;
%                 coding_rate=616;
%                 coding_rate = coding_rate/1024;
%             elseifTB_SINR_dB>=10.37 && TB_SINR_dB<12.3
%                 assigned_CQI=10;
%                 modulation_order=6;
%                 coding_rate=466;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=12.3 && TB_SINR_dB<14.18
%                 assigned_CQI=11;
%                  modulation_order=6;
%                 coding_rate=567;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=14.18 && TB_SINR_dB<15.89
%                 assigned_CQI=12;
%                  modulation_order=6;
%                 coding_rate=666;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=15.89 && TB_SINR_dB<17.82
%                 assigned_CQI=13;
%                  modulation_order=6;
%                 coding_rate=772;
%                 coding_rate = coding_rate/1024;
%             elseif TB_SINR_dB>=17.82 && TB_SINR_dB<19.83
%                 assigned_CQI=14;
%                 modulation_order=6;
%                 coding_rate=873;
%                 coding_rate = coding_rate/1024;
%             else 
%                 assigned_CQI=15;
%                 modulation_order=6;
%                 coding_rate=948;
%                 coding_rate = coding_rate/1024;
%             end

    %% grafiki cqi
%     %SINRvector= [-8.5 -6.7 -4.7 -2.3 0.2 2.4 4.3 5.9 8.1 10.3 11.7 14.1 16.3 18.7 21.0 22.7];
%     %SINRvector = [-6.934 -5.147 -3.18 -1.254 0.761 2.70 4.697 6.528 8.576 10.37 12.3 14.18 15.89 17.82 19.83 21];
%     SINRvector = [-5.147 -3.18 -1.254 0.761 2.70 4.697 6.528 8.576 10.37 12.3 14.18 15.89 17.82 19.83];
%     CQIvector=   [1    2    3   4   5   6   7   8    9   10   11   12   13   14];
% 
%     x=linspace(-20,30,50);
%     figure;
%     plot(SINRvector,CQIvector);
%     grid on;
%     hold on;
%     xlim([-20 30]);
%     ylim([-0.5 16]);
%     xlabel('SINR [dB]');
%     ylabel('CQI');
%     xticks(SINRvector);
%     yticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14]);
% 
%     syms x;
%     y=piecewise(x<-5.147,0,x>19.83);
%     fplot(y,'blue');

    %% (palia) modulation_order,coding_rate
%     for i=1:15
%         if i==1
%             modulation_order(i,1)=2;
%             coding_rate(i,1)=78;
%         elseif i==2
%             modulation_order(i,1)=2;
%             coding_rate(i,1)=120;
%         elseif i==3
%             modulation_order(i,1)=2;
%             coding_rate(i,1)=193;
%         elseif i==4
%             modulation_order(i,1)=2;
%             coding_rate(i,1)=308;
%         elseif i==5
%             modulation_order(i,1)=2;
%             coding_rate(i,1)=449;
%         elseif i==6
%             modulation_order(i,1)=2;
%             coding_rate(i,1)=602;
%         elseif i==7
%             modulation_order(i,1)=4;
%             coding_rate(i,1)=378;
%         elseif i==8
%             modulation_order(i,1)=4;
%             coding_rate(i,1)=490;
%         elseif i==9
%             modulation_order(i,1)=4;
%             coding_rate(i,1)=616;
%         elseif i==10
%             modulation_order(i,1)=6;
%             coding_rate(i,1)=466;
%         elseif i==11
%             modulation_order(i,1)=6;
%             coding_rate(i,1)=567;
%         elseif i==12
%             modulation_order(i,1)=6;
%             coding_rate(i,1)=666;
%         elseif i==13
%             modulation_order(i,1)=6;
%             coding_rate(i,1)=772;
%         elseif i==14
%             modulation_order(i,1)=6;
%             coding_rate(i,1)=873;
%         elseif i==15
%             modulation_order(i,1)=6;
%             coding_rate(i,1)=948;
%         end
%         coding_rate(i,1)=coding_rate(i,1)/1024;
%     end
            
    %% arxikopoihseis
    cqi=zeros(UEspercell,totaleNBs,2,'single');
    modulation_order=zeros(UEspercell,totaleNBs,2,'single');
    coding_rate=zeros(UEspercell,totaleNBs,2,'single');
    
    
    %% sinr1
    for j=1:UEspercell
        for i=1:totaleNBs
            if sinr1(j,i)<-5.147
                cqi(j,i,1)=1;
                modulation_order(j,i,1)=2; 
                coding_rate(j,i,1)=78;
                %sumcqi(1,1)=sumcqi(1,1)+1;
            elseif sinr1(j,i)>=-5.147 && sinr1(j,i)<-3.18 
                cqi(j,i,1)=2;     
                modulation_order(j,i,1)=2;
                coding_rate(j,i,1)=120;
                %sumcqi(2,2)=sumcqi(2,2)+1;
            elseif sinr1(j,i)>=-3.18 && sinr1(j,i)<-1.254  
                cqi(j,i,1)=3;
                modulation_order(j,i,1)=2;
                coding_rate(j,i,1)=193;
                %sumcqi(3,2)=sumcqi(3,2)+1;
            elseif sinr1(j,i)>=-1.254 && sinr1(j,i)<0.761    
                cqi(j,i,1)=4;  
                modulation_order(j,i,1)=2;
                coding_rate(j,i,1)=308;
                %sumcqi(4,2)=sumcqi(4,2)+1;
            elseif sinr1(j,i)>=0.761 && sinr1(j,i)<2.70   
                cqi(j,i,1)=5;
                modulation_order(j,i,1)=2;
                coding_rate(j,i,1)=449;
                %sumcqi(5,2)=sumcqi(5,2)+1;
            elseif sinr1(j,i)>=2.70 && sinr1(j,i)<4.697   
                cqi(j,i,1)=6;
                modulation_order(j,i,1)=2;
                coding_rate(j,i,1)=602;
                %sumcqi(6,2)=sumcqi(6,2)+1;
            elseif sinr1(j,i)>=4.697 && sinr1(j,i)<6.528  
                cqi(j,i,1)=7;
                modulation_order(j,i,1)=4;
                coding_rate(j,i,1)=378;
                %sumcqi(7,2)=sumcqi(7,2)+1;
            elseif sinr1(j,i)>=6.528 && sinr1(j,i)<8.576    
                cqi(j,i,1)=8;
                modulation_order(j,i,1)=4;
                coding_rate(j,i,1)=490;
                %sumcqi(8,2)=sumcqi(8,2)+1;
            elseif sinr1(j,i)>=8.576 && sinr1(j,i)<10.37 
                cqi(j,i,1)=9;
                modulation_order(j,i,1)=4;
                coding_rate(j,i,1)=616;
                %sumcqi(9,2)=sumcqi(9,2)+1;
            elseif sinr1(j,i)>=10.37 && sinr1(j,i)<12.3 
                cqi(j,i,1)=10;
                modulation_order(j,i,1)=6;
                coding_rate(j,i,1)=466;
                %sumcqi(10,2)=sumcqi(10,2)+1;
            elseif sinr1(j,i)>=12.3 && sinr1(j,i)<14.18 
                cqi(j,i,1)=11;
                modulation_order(j,i,1)=6;
                coding_rate(j,i,1)=567;
                %sumcqi(11,2)=sumcqi(11,2)+1;
            elseif sinr1(j,i)>=14.18 && sinr1(j,i)<15.89 
                cqi(j,i,1)=12;
                modulation_order(j,i,1)=6;
                coding_rate(j,i,1)=666;
                %sumcqi(12,2)=sumcqi(12,2)+1;
            elseif sinr1(j,i)>=15.89 && sinr1(j,i)<17.82 
                cqi(j,i,1)=13;
                modulation_order(j,i,1)=6;
                coding_rate(j,i,1)=772;
                %sumcqi(13,2)=sumcqi(13,2)+1;
            elseif sinr1(j,i)>=17.82 && sinr1(j,i)<19.83  
                cqi(j,i,1)=14;
                modulation_order(j,i,1)=6;
                coding_rate(j,i,1)=873;
                %sumcqi(14,2)=sumcqi(14,2)+1;
            elseif sinr1(j,i)>=19.83
                cqi(j,i,1)=15;
                modulation_order(j,i,1)=6;
                coding_rate(j,i,1)=948;
                %sumcqi(15,2)=sumcqi(16,2)+1;
            end
            cqisum(tti,cqi(j,i,1),1)=cqisum(tti,cqi(j,i,1),1)+1;
            coding_rate(j,i,1)=coding_rate(j,i,1)/1024;
            modulation_order(j,i,1)=modulation_order(j,i,1);
        end
    end
    
    %% sinr2
    for j=1:UEspercell
        for i=1:totaleNBs
            if sinr2(j,i)<-5.147
                cqi(j,i,2)=1;
                modulation_order(j,i,2)=2;
                coding_rate(j,i,2)=78;
                %sumcqi(1,1)=sumcqi(1,1)+1;
            elseif sinr2(j,i)>=-5.147 && sinr2(j,i)<-3.18 
                cqi(j,i,2)=2;
                modulation_order(j,i,2)=2;
                coding_rate(j,i,2)=120;
                %sumcqi(2,2)=sumcqi(2,2)+1;
            elseif sinr2(j,i)>=-3.18 && sinr2(j,i)<-1.254  
                cqi(j,i,2)=3; 
                modulation_order(j,i,2)=2;
                coding_rate(j,i,2)=193;
                %sumcqi(3,2)=sumcqi(3,2)+1;
            elseif sinr2(j,i)>=-1.254 && sinr2(j,i)<0.761    
                cqi(j,i,2)=4;
                modulation_order(j,i,2)=2;
                coding_rate(j,i,2)=308;
                %sumcqi(4,2)=sumcqi(4,2)+1;
            elseif sinr2(j,i)>=0.761 && sinr2(j,i)<2.70   
                cqi(j,i,2)=5;
                modulation_order(j,i,2)=2;
                coding_rate(j,i,2)=449;
                %sumcqi(5,2)=sumcqi(5,2)+1;
            elseif sinr2(j,i)>=2.70 && sinr2(j,i)<4.697   
                cqi(j,i,2)=6;
                modulation_order(j,i,2)=2;
                coding_rate(j,i,2)=602;
                %sumcqi(6,2)=sumcqi(6,2)+1;
            elseif sinr2(j,i)>=4.697 && sinr2(j,i)<6.528  
                cqi(j,i,2)=7;
                modulation_order(j,i,2)=4;
                coding_rate(j,i,2)=378;
                %sumcqi(7,2)=sumcqi(7,2)+1;
            elseif sinr2(j,i)>=6.528 && sinr2(j,i)<8.576    
                cqi(j,i,2)=8;
                modulation_order(j,i,2)=4;
                coding_rate(j,i,2)=490;
                %sumcqi(8,2)=sumcqi(8,2)+1;
            elseif sinr2(j,i)>=8.576 && sinr2(j,i)<10.37 
                cqi(j,i,2)=9;
                modulation_order(j,i,2)=4;
                coding_rate(j,i,2)=616;
                %sumcqi(9,2)=sumcqi(9,2)+1;
            elseif sinr2(j,i)>=10.37 && sinr2(j,i)<12.3 
                cqi(j,i,2)=10;
                modulation_order(j,i,2)=6;
                coding_rate(j,i,2)=466;
                %sumcqi(10,2)=sumcqi(10,2)+1;
            elseif sinr2(j,i)>=12.3 && sinr2(j,i)<14.18 
                cqi(j,i,2)=11;
                modulation_order(j,i,2)=6;
                coding_rate(j,i,2)=567;
                %sumcqi(11,2)=sumcqi(11,2)+1;
            elseif sinr2(j,i)>=14.18 && sinr2(j,i)<15.89 
                cqi(j,i,2)=12;
                modulation_order(j,i,2)=6;
                coding_rate(j,i,2)=666;
                %sumcqi(12,2)=sumcqi(12,2)+1;
            elseif sinr2(j,i)>=15.89 && sinr2(j,i)<17.82 
                cqi(j,i,2)=13;
                modulation_order(j,i,2)=6;
                coding_rate(j,i,2)=772;
                %sumcqi(13,2)=sumcqi(13,2)+1;
            elseif sinr2(j,i)>=17.82 && sinr2(j,i)<19.83  
                cqi(j,i,2)=14;
                modulation_order(j,i,2)=6;
                coding_rate(j,i,2)=873;
                %sumcqi(14,2)=sumcqi(14,2)+1;
            elseif sinr2(j,i)>=19.83
                cqi(j,i,2)=15;
                modulation_order(j,i,2)=6;
                coding_rate(j,i,2)=948;
                %sumcqi(15,2)=sumcqi(16,2)+1;
            end
            cqisum(tti,cqi(j,i,2),2)=cqisum(tti,cqi(j,i,2),2)+1;
            coding_rate(j,i,2)=coding_rate(j,i,2)/1024;
            modulation_order(j,i,2)=modulation_order(j,i,2);
        end
    end
    
%     for i=1:16
%         sumcqi(i,2)=100*(sumcqi(i,2)/totalUEs);
%         sumcqi(i,1)=i-1;
%     end
        
end