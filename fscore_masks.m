
% close all;
% clear all;
% clc;
N = 328
st = 0;
Fsc=[];
MIU=[];
PA=[];
for i = st:st+N
   gname = strcat('./Brain_test/',num2str(i,'%04d'),'.png');
   imgname = strcat('./arxiv/result_all/vseg_pix/',num2str(i),'.png');
   I = double(imread(imgname));tmp2=zeros(512,512);
   tmp2(I>130) = 255;
   tmp2(I<131) = 0;
   tmp = double(imread(gname));tmp=tmp(:,513:end);tmp(tmp<150)=0;tmp(tmp>150)=255;
   tp=0;fp=0;fn=0;tn=0;uni=0;ttp=0;
   for p =1:512
       for q =1:512
           if tmp(p,q)==0
               if tmp2(p,q) == tmp(p,q)
                   tn = tn+1;
               else
                   fp = fp+1;
                   uni = uni+1;
                   ttp = ttp+1;
               end
           elseif tmp(p,q)==255
               if tmp2(p,q) == tmp(p,q)
                   tp = tp+1;
                   ttp = ttp+1;
               else
                   fn = fn+1;
               end
               uni = uni+1;
           end
       end
   end
   if (tp~=0)
       F = (2*tp)/(2*tp+fp+fn);
       MIU=[MIU,(tp*1.0/uni)];
       PA=[PA,(tp*1.0/ttp)];
       Fsc=[Fsc;[i,F]];
   else
       MIU=[MIU,1];
       PA=[PA,1];
       Fsc=[Fsc;[i,1]];
   end
   i
end
% plot(Fsc(:,1),Fsc(:,2),'-*')
% hold on
% plot(Fsc(:,1),Fsc1(:,2),'-s')
% hold off
% figure();plot(Fsc(:,1),PA,'-*');hold on
% plot(Fsc(:,1),PA1,'-s');hold off
% Fsc1=Fsc;
% MIU1=MIU;
% PA1=PA;