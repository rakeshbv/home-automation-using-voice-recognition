function c=MfccReal()
obj=audiorecorder(8000,16,1);
disp('Start talking');
recordblocking(obj, 2);
y1=getaudiodata(obj);
Fs=8000;
y1=y1(:,1);
%windowsize = Fs/40;
%trailingsamples = mod(length(y1), windowsize);
%S = reshape( y1(1:end-trailingsamples), windowsize,[]); %Dividing the signal into windows of 25ms 
%hamW=hamming(windowsize);
%SH=diag(hamW)*S; %Hamming each windows

N = 256;                        % frame size
M = 100;                        % inter frame distance
l = length(y1);
numberOfFrames = 1 + floor((l - N)/double(M));
mat = zeros(N, numberOfFrames); % vector of frame vectors

for i=1:numberOfFrames
    index = 100*(i-1) + 1;
    for j=1:N
        mat(j,i) = y1(index);
        index = index + 1;
    end
end
windowsize=N;
hamW=hamming(windowsize);
SH=diag(hamW)*mat; %Hamming each windows

SHf=fft(SH,512);
SHf=SHf(1:257,:);
P=(abs(SHf).^2)/windowsize;

lowFreq=300;
highFreq=8000;
samplerate=8000;
no_of_banks=26;

Mel_lf=2595*log10(1+(lowFreq/700));
Mel_hf=2595*log10(1+(highFreq/700));

Mel_freqArray=linspace(Mel_lf,Mel_hf,no_of_banks+2);
Lin_freqArray=700*(exp(Mel_freqArray./1125)-1);
f=floor((513)*Lin_freqArray/samplerate);

HMatrix(no_of_banks,windowsize)=zeros();

for k=1:(windowsize+1)
    for m=1:no_of_banks
        if(k<f(m))
            HMatrix(m,k)=0;
        elseif (f(m)<=k && k<=f(m+1))
            HMatrix(m,k)=(k-f(m))/(f(m+1)-f(m));
        elseif(f(m+1)<=k && k<=f(m+2))
             HMatrix(m,k)=(f(m+2)-k)/(f(m+2)-f(m+1));
        elseif (k>f(m+2))
             HMatrix(m,k)=0;
        end
    end
end

PH=HMatrix*P;
Pfb=zeros(1,26);

for k=1:26
    Pfb(k)=sum(PH(k,:));
end

Pfb=Pfb(2:13);
PfbDb=log(Pfb);
c=dct(PfbDb);