function Fractalize()
tic ;
Pic_name='lena-128x128.jpg';
Original_pic=imread(Pic_name);
Pic_size=size(Original_pic);
[a r_block X_size]=Fractal_coding(Pic_name,4);
X=zeros(X_size);
X(:)=128;
for ii=1:25
    temp_X=Fractal_decoding(a,X,r_block);
    X=temp_X;
    disp(['End of run ',num2str(ii),' th.']) ;
end
fractime  = toc ;
disp(mat2str(fractime))   ;
imshow(uint8(X));
Original_pic=imread(Pic_name);
Psnr=10*log((255^2)/((1/(Pic_size(1)*Pic_size(1)))*sum(sum((double(Original_pic)-X).^2))));
imwrite(uint8(X),['new\result.jpg']);
dlmwrite('new\psnr.txt',Psnr);
dlmwrite('new\time.txt',fractime);
save('X','X');
end