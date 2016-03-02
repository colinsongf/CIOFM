function loadImage(path)


fileFolder=fullfile('/home/guo/桌面/ordinal dataset/FG-NET/Images');
dirOutput=dir(fullfile(fileFolder,'*'));
fileNames={dirOutput.name}';


Imf=fopen('ImageFile.txt','at');

len=length(fileNames);

dataMat=[];
label=[];
ynum=0;
for i = 1:len;
     lenofim=length(fileNames{i});
     ynum=0;
       if ( lenofim>7);
        
         ynum=str2num(fileNames{i}(5))*10+str2num(fileNames{i}(6));
         imdata=imread(['/home/guo/桌面/ordinal dataset/FG-NET/Images/',fileNames{i}]);
         lev=graythresh(imdata);
         bwimg=im2bw(imdata,lev);
         %t3=bwimg(2,1)
         newimg=imresize(bwimg,[16,16]);
         
         for row=1:16
             for col=1:16   
                 fprintf(Imf,'%d ',newimg(row,col));
             end
         end
         fprintf(Imf,'%d ',ynum);
         fprintf(Imf,'\n');
         
    end
end
fclose(Imf);
        
