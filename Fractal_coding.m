function [result r_block X_size]= Fractal_coding(image_name,r_block)

X=double(imread(image_name));
X_size=size(X);
d_block=2*r_block;
r=X_size/r_block;
d=r/2;
1
% for k=1:X_size(1)-d_block+1
%     for l=1:X_size(1)-d_block+1
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Y(k,l,1).d=X(k:(k-1)+d_block,l:(l-1)+d_block);
%         temp_d=imresize(Y(k,l).d,0.5);
%         Y(k,l,1).sum_d=sum(sum(temp_d));
%         Y(k,l,1).sum_d_2=sum(sum((temp_d).^2));
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Y(k,l,1).mode=temp_d;
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Y(k,l,2).mode=imrotate(temp_d,90,'bilinear');
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Y(k,l,3).mode=imrotate(temp_d,180,'bilinear');
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Y(k,l,4).mode=imrotate(temp_d,270,'bilinear');
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         tform=maketform('affine',[-1 0 0; 0 1 0; 0 0 1]);
%         Y(k,l,5).mode=imtransform(temp_d,tform);
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         tform=maketform('affine',[1 0 0; 0 -1 0; 0 0 1]);
%         Y(k,l,6).mode=imtransform(temp_d,tform);
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         tform=maketform('affine',[0 1 0; 1 0 0; 0 0 1]);
%         Y(k,l,7).mode=imtransform(temp_d,tform);
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         tform=maketform('affine',[-1 0 0; 0 -1 0; 0 0 1]);
%         Y(k,l,8).mode=imtransform(temp_d,tform);
%         %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     end
% end
% save('lena-128x128_domain_and_range pool_range block4','Y');
2
load('lena-128x128_domain_and_range pool_range block4');
% for ii=1:r(1)
%     for jj=1:r(1)
%         RB=X((ii-1)*r_block+1:ii*r_block,(jj-1)*r_block+1:jj*r_block);
%         SR=sum(sum(RB));
%         n=r_block^2;
%         Min=inf;
%         for k=1:X_size(1)-d_block+1
%             for l=1:X_size(1)-d_block+1
%                 sent2=SR*Y(k,l,1).sum_d;
%                 sent4=Y(k,l,1).sum_d^2;
%                 for h=1:8
%                     D_rotated=Y(k,l,h).mode;
%                     sent1=n*sum(sum(RB.*D_rotated));
%                     S=(sent1-sent2)/(n * Y(k,l,1).sum_d_2-sent4);
%                     O=(SR-S*Y(k,l,1).sum_d)/n;
%                     help1=sum(sum((D_rotated*S - RB +O).^2));
%                     help2=sum(sum((D_rotated -  RB).^2));
%                     if help1 > help2
%                         S=1;
%                         O=0;
%                         RMS=help2;
%                     else
%                         RMS=help1;
%                     end
%                     if RMS<Min
%                     Min=RMS;
%                         temp_result(ii,jj).domain_index=[k l];
%                         temp_result(ii,jj).rotation=h;
%                         temp_result(ii,jj).S=S;
%                         temp_result(ii,jj).O=O;
%                     end
%                 end
%             end
%         end
%     end
% end
% save('lena-128x128_coding block4','temp_result');
load('lena-128x128_coding block4');
t=zeros(32,32);
t(:)=temp_result.O
result=temp_result;

