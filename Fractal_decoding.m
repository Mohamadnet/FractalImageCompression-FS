function result = Fractal_decoding(image_code,X,r_block)

X_size=size(X);
Z=zeros(X_size);
d_block=2*r_block;
r=X_size/r_block;
d=r/2;
3

% load('lena-128x128_domain_and_range pool_range block4');

for i=1:r(1)
    for j=1:r(1)
        Y(i,j).r=X((i-1)*r_block+1:i*r_block,(j-1)*r_block+1:j*r_block);
    end
end

for k=1:X_size(1)-d_block+1
    for l=1:X_size(1)-d_block+1
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Y(k,l).d=X(k:(k-1)+d_block,l:(l-1)+d_block);
        temp_d=imresize(Y(k,l).d,0.5);
        Y(k,l).sum_d=sum(sum(temp_d));
        Y(k,l).sum_d_2=sum(sum((temp_d).^2));
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Y(k,l).mode1=temp_d;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Y(k,l).mode2=imrotate(temp_d,90,'bilinear');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Y(k,l).mode3=imrotate(temp_d,180,'bilinear');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        Y(k,l).mode4=imrotate(temp_d,270,'bilinear');
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        tform=maketform('affine',[-1 0 0; 0 1 0; 0 0 1]);
        Y(k,l).mode5=imtransform(temp_d,tform);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        tform=maketform('affine',[1 0 0; 0 -1 0; 0 0 1]);
        Y(k,l).mode6=imtransform(temp_d,tform);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        tform=maketform('affine',[0 1 0; 1 0 0; 0 0 1]);
        Y(k,l).mode7=imtransform(temp_d,tform);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        tform=maketform('affine',[-1 0 0; 0 -1 0; 0 0 1]);
        Y(k,l).mode8=imtransform(temp_d,tform);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    end
end

for i=1:r(1)
    for j=1:r(1)    
                        if image_code(i,j).rotation==1
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode1;  
                        elseif image_code(i,j).rotation==2
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode2;
                        elseif image_code(i,j).rotation==3
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode3;
                        elseif image_code(i,j).rotation==4
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode4;
                        elseif image_code(i,j).rotation==5
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode5;
                        elseif image_code(i,j).rotation==6
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode6;
                        elseif image_code(i,j).rotation==7
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode7;
                        elseif image_code(i,j).rotation==8
                            result_temp_d=Y(image_code(i,j).domain_index(1),image_code(i,j).domain_index(2)).mode8;
                        end
                        Z((i-1)*r_block+1:i*r_block,(j-1)*r_block+1:j*r_block)=image_code(i,j).S .* result_temp_d + image_code(i,j).O;
                        
    end
end
result=Z;
4
end