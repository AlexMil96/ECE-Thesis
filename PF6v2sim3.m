%Proportionally Fair v2 simscheduler
function [usagepertti,instant_throughput,usage,allocation,metric,num,den,starvcounter]=PF6v2sim3(type,sectoring,usagepertti,tti,UEspercell,...
totaleNBs,totalRBs,instant_throughput,usage,modulation_order,coding_rate,allocation,metric,num,den,starvcounter)

%% arxikopoihseis
k=10;    %previous tti memory
a=1-1/k;
if type=="urban"
    death=14;
elseif type=="suburban"
    death=4;
end

%%
if sectoring==0
    for i=1:totaleNBs
        if tti==1
            for j=1:UEspercell
                den(j,i)=1;
            end
        end
        for m=1:totalRBs
            x=find(starvcounter(:,i)>=death,1); %briskw posa einai starved se auto to tti
            tf=isempty(x);  %tf=1 kanena starved, tf=0 exw starved
            if tf==1  %den exw starved UEs 
                for j=1:UEspercell
                    num(j,i)=throughputcalc(tti,1,modulation_order(j,i,1),modulation_order(j,i,2),coding_rate(j,i,1),coding_rate(j,i,2));
                    metric(j,i,tti)=num(j,i)/den(j,i);
                end
                maxthr=max(metric(:,i,tti));
                maxindexes = find(metric(:,i,tti)==maxthr);
                if length(maxindexes)>1
                    maxind=maxindexes(randi(numel(maxindexes)));
                else
                    maxind=maxindexes;
                end
                starvcounter(maxind,i)=0;
                usagepertti(maxind,i)=usagepertti(maxind,i)+1;
                allocation{tti,i}(maxind,m)=1;
                den(maxind,i)=a*den(maxind,i)+(1-a)*num(maxind,i);
                for j=1:UEspercell
                     if j~=maxind   
                        den(j,i)=a*den(j,i);
                        %starvcounter(j,i)=starvcounter(j,i)+1;
                    end
                end
            elseif tf==0 %exw starved UEs
                [maxstarved,maxind]=max(starvcounter(:,i));
                usagepertti(maxind,i)=usagepertti(maxind,i)+1;
                allocation{tti,i}(maxind,m)=1;
                den(maxind,i)=a*den(maxind,i)+(1-a)*num(maxind,i);
                starvcounter(maxind,i)=0;
                for j=1:UEspercell
                    if j~=maxind
                        den(j,i)=a*den(j,i);
                        %starvcounter(j,i)=starvcounter(j,i)+1;
                    end
                end   
            end
        end
        for j=1:UEspercell
            if usagepertti(j,i)==0
                instant_throughput(j,i)=0;
                starvcounter(j,i)=starvcounter(j,i)+1;
            else
                instant_throughput(j,i)=throughputcalc(tti,usagepertti(j,i),modulation_order(j,i,1),modulation_order(j,i,2),...
                coding_rate(j,i,1),coding_rate(maxind,i,2));
            end
            usage(j,i)=usage(j,i)+usagepertti(j,i);
        end
    end
        
elseif sectoring==1
    for i=1:totaleNBs
        if tti==1
            for j=1:UEspercell(1,i)
                den(j,i)=1;
            end
        end
        for m=1:totalRBs
            x=find(starvcounter(:,i)>=death,1); %briskw posa einai starved se auto to tti
            tf=isempty(x);  %tf=1 kanena starved, tf=0 exw starved
            if tf==1  %den exw starved UEs 
                for j=1:UEspercell(1,i)
                    num(j,i)=throughputcalc(tti,1,modulation_order(j,i,1),modulation_order(j,i,2),coding_rate(j,i,1),coding_rate(j,i,2));
                    metric(j,i,tti)=num(j,i)/den(j,i);
                end
                maxthr=max(metric(:,i,tti));
                maxindexes = find(metric(:,i,tti)==maxthr);
                if length(maxindexes)>1
                    maxind=maxindexes(randi(numel(maxindexes)));
                else
                    maxind=maxindexes;
                end
                starvcounter(maxind,i)=0;
                usagepertti(maxind,i)=usagepertti(maxind,i)+1;
                allocation{tti,i}(maxind,m)=1;
                den(maxind,i)=a*den(maxind,i)+(1-a)*num(maxind,i);
                for j=1:UEspercell(1,i)
                     if j~=maxind   
                        den(j,i)=a*den(j,i);
                        %starvcounter(j,i)=starvcounter(j,i)+1;
                    end
                end
            elseif tf==0 %exw starved UEs
                [maxstarved,maxind]=max(starvcounter(:,i));
                usagepertti(maxind,i)=usagepertti(maxind,i)+1;
                allocation{tti,i}(maxind,m)=1;
                den(maxind,i)=a*den(maxind,i)+(1-a)*num(maxind,i);
                starvcounter(maxind,i)=0;
                for j=1:UEspercell(1,i)
                    if j~=maxind
                        den(j,i)=a*den(j,i);
                        %starvcounter(j,i)=starvcounter(j,i)+1;
                    end
                end   
            end
        end
        for j=1:UEspercell(1,i)
            tf=isnan(instant_throughput(j,i));
            if tf==0
                if usagepertti(j,i)==0
                    instant_throughput(j,i)=0;
                    starvcounter(j,i)=starvcounter(j,i)+1;
                else
                    instant_throughput(j,i)=throughputcalc(tti,usagepertti(j,i),modulation_order(j,i,1),modulation_order(j,i,2),...
                    coding_rate(j,i,1),coding_rate(maxind,i,2));
                end
                usage(j,i)=usage(j,i)+usagepertti(j,i);
            end
        end
    end
    
end
  
     %%   
%     for m=1:totalRBs
%         x=find(starvcounter(:,i)>=death);
%         tf=isempty(x);
%         if tf==1  %den einai kanena starved
%             
%             
%         else   %exw starved UEs
%             [maxstarved,maxind]=max(starvcounter(:,i));
%             usagepertti{tti,1}(maxind,i)=usagepertti{tti,1}(maxind,i)+1
%             allocation{tti,i}(maxind,m)=1;
%             den(maxind,i)=a*den(maxind,i)+(1-a)*num(maxind,i);
%             starvcounter(maxind,i)=0;
%             for j=1:UEspercell
%                 if j~=maxind
%                     den(j,i)=a*den(j,i);
%                     starvcounter(j,i)=starvcounter(j,i)+1;
%                 end
%             end
%         end
    %%
    % for i=1:totaleNBs  %arxikopoihsh metric
%     if tti==1
%         for j=1:UEspercell
%             num(j,i)=throughputcalc(tti,5,modulation_order(j,i,1),modulation_order(j,i,2),coding_rate(j,i,1),coding_rate(j,i,2));
%             den(j,i)=1;
%             metric(j,i)=num(j,i)/den(j,i);
%         end
%     end
%     
%     sumstarved=sum(starvcounter(:,i)>=death);  %exw 3 cases, na exw sumstarved=0, 0<sumstarved<100 kai sumstarved>=100 
%     if sumstarved==0  %case 1
%         for m=1:totalRBs
%             maxthr=max(metric(:,i));
%             maxindexes = find(metric(:,i)==maxthr);
%             if length(maxindexes)>1
%                 maxind=maxindexes(randi(numel(maxindexes)));
%             else
%                 maxind=maxindexes;
%             end
%             usagepertti{tti,1}(maxind,i)=usagepertti{tti,1}(maxind,i)+1;
%             allocation{tti,i}(maxind,m)=1;
%             scheduled_once(maxind,i)=1;
%             %metric(maxind,i)=throughputcalc(tti,usagepertti{tti,1}(maxind,i),modulation_order(maxind,i,1),modulation_order(maxind,i,2),coding_rate(maxind,i,1),coding_rate(maxind,i,2));
%             num(maxind,i)=throughputcalc(tti,usagepertti{tti,1}(maxind,i),modulation_order(maxind,i,1),modulation_order(maxind,i,2),coding_rate(maxind,i,1),coding_rate(maxind,i,2));
%             den(maxind,i)=a*den(maxind,i)+(1-a)*num(maxind,i);
%             metric(maxind,i)=num(maxind,i)/den(maxind,i);
%             for j=1:UEspercell
%                 if j~=maxind && usagepertti{tti,1}(j,i)==0
%                     den(j,i)=a*den(j,i);
%                     metric(j,i)=num(j,i)/den(j,i);
%                 end
%             end
%         end
%     elseif sumstarved<totalRBs && sumstarved>0  %case 2
%         for m=1:sumstarved
%             idxpool=find(starvcounter(:,i)>=death);
%             if length(idxpool)>1
%                 idx=idxpool(randi(numel(idxpool)));
%             else
%                 idx=idxpool;
%             end
%             idxpool(idxpool==idx)=[];
%             usagepertti{tti,1}(idx,i)=usagepertti{tti,1}(idx,i)+1;
%             allocation{tti,i}(idx,m)=1;
%             scheduled_once(idx,i)=1;
%             num(idx,i)=throughputcalc(tti,usagepertti{tti,1}(idx,i),modulation_order(idx,i,1),modulation_order(idx,i,2),coding_rate(idx,i,1),coding_rate(idx,i,2));
%             den(idx,i)=a*den(idx,i)+(1-a)*num(idx,i);
%             metric(idx,i)=num(idx,i)/den(idx,i);
%             for j=1:UEspercell
%                 if j~=idx && usagepertti{tti,1}(j,i)==0
%                     den(j,i)=a*den(j,i);
%                     metric(j,i)=num(j,i)/den(j,i);
%                 end
%             end
%         end
%         for m=(sumstarved)+1:totalRBs
%             maxthr=max(metric(:,i));
%             maxindexes = find(metric(:,i)==maxthr);
%             if length(maxindexes)>1
%                 maxind=maxindexes(randi(numel(maxindexes)));
%             else
%                 maxind=maxindexes;
%             end
%             usagepertti{tti,1}(maxind,i)=usagepertti{tti,1}(maxind,i)+1;
%             allocation{tti,i}(maxind,m)=1;
%             scheduled_once(maxind,i)=1;
%             %metric(maxind,i)=throughputcalc(tti,usagepertti{tti,1}(maxind,i),modulation_order(maxind,i,1),modulation_order(maxind,i,2),coding_rate(maxind,i,1),coding_rate(maxind,i,2));
%             num(maxind,i)=throughputcalc(tti,usagepertti{tti,1}(maxind,i),modulation_order(maxind,i,1),modulation_order(maxind,i,2),coding_rate(maxind,i,1),coding_rate(maxind,i,2));
%             den(maxind,i)=a*den(maxind,i)+(1-a)*num(maxind,i);
%             metric(maxind,i)=num(maxind,i)/den(maxind,i);
%             for j=1:UEspercell
%                 if j~=maxind && usagepertti{tti,1}(j,i)==0
%                     den(j,i)=a*den(j,i);
%                     metric(j,i)=num(j,i)/den(j,i);
%                 end
%                 endx`
%         end
%         
%     elseif sumstarved>=totalRBs  %case 3
%         for m=1:totalRBs
%             idxpool=find(starvcounter(:,i)>=death);
%             if length(idxpool)>1
%                 idx=idxpool(randi(numel(idxpool)));
%             else
%                 idx=idxpool;
%             end
%             idxpool(idxpool==idx)=[];
%             usagepertti{tti,1}(idx,i)=usagepertti{tti,1}(idx,i)+1;
%             allocation{tti,i}(idx,m)=1;
%             scheduled_once(idx,i)=1;
%             num(idx,i)=throughputcalc(tti,usagepertti{tti,1}(idx,i),modulation_order(idx,i,1),modulation_order(idx,i,2),coding_rate(idx,i,1),coding_rate(idx,i,2));
%             den(idx,i)=a*den(idx,i)+(1-a)*num(idx,i);
%             metric(idx,i)=num(idx,i)/den(idx,i);
%             for j=1:UEspercell
%                 if j~=idx && usagepertti{tti,1}(j,i)==0
%                     den(j,i)=a*den(j,i);
%                     metric(j,i)=num(j,i)/den(j,i);
%                 end
%             end
%         end
%     end
%     
%     % ypologismos throughput kai starvcounter sto telos tou tti
%     for j=1:UEspercell
%         if usagepertti{tti,1}(j,i)==0
%             instant_throughput(j,i,tti)=0;
%             starvcounter(j,i)=starvcounter(j,i)+1;
%         else
%             instant_throughput(j,i,tti)=throughputcalc(tti,usagepertti{tti,1}(j,i),modulation_order(j,i,1),modulation_order(j,i,2),coding_rate(j,i,1),coding_rate(j,i,2));
%             starvcounter(j,i)=0;
%         end
%         usage(j,i)=usage(j,i)+usagepertti{tti,1}(j,i);
%     end
%     
%    
% end