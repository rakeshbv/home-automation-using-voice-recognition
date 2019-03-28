c1=Mfcc('L1.wav');
c2=Mfcc('N1.wav');
c=[c1;c2];
fileID=fopen('Data.txt','a'); %CHANGE THE FILE MODE AS REQUIRED%
for i=1:10
    if i==1
        fprintf(fileID,'%f, ',[c(i,:),1]);
        fprintf(fileID,'\n');
    else
        fprintf(fileID,'%f, ',[c(i,:),0]);
        fprintf(fileID,'\n');
    end
end
fclose(fileID);