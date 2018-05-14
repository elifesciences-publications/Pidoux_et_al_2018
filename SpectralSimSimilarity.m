function [AllSimilarity,AllOffset,files,indexes]=SpectralSimsimilarity(cd1,cd2,n1,n2,SF,window,overlap,freqmin,freqmax)

if nargin<9
    freqmin=1000; freqmax=6000;
    if nargin<7
        window=512; overlap=128;
        if nargin<5
            SF=44100;
        end
    end
end

cd(cd1)
filelist1=ls('*.wav');
FileNbPermut1=randperm(size(filelist1,1));
files{1}=filelist1(FileNbPermut1(1:min(n1,size(filelist1,1))),:); indexes{1}=FileNbPermut1(1:min(n1,size(filelist1,1)));
cd(cd2)
filelist2=ls('*.wav');
FileNbPermut2=randperm(size(filelist2,1));
files{2}=filelist2(FileNbPermut2(1:min(n2,size(filelist2,1))),:); indexes{2}=FileNbPermut2(1:min(n2,size(filelist2,1)));

for i=1:min(n1,size(filelist1,1))
    sound1=audioread([cd1 filelist1(FileNbPermut1(i),:)]); 
    for j=1:min(n2,size(filelist2,1))
        sound2=audioread([cd2 filelist2(FileNbPermut2(j),:)]);
        if length(sound1)>length(sound2)
            sound3=sound2; sound2=sound1; sound1=sound3;
        end
        [syl_spg,freqg,timeS]=spectrogram(sound1,window,window-overlap,window,SF);
        [mot_spg,freqg,timeM]=spectrogram(sound2,window,window-overlap,window,SF);

        lspg=min(size(syl_spg,2),size(mot_spg,2)); cg1=min(find(freqg>freqmin)); cg2=max(find(freqg<freqmax));
        for w=1:(size(mot_spg,2)-size(syl_spg,2)+1)
            pseudosyl_spg=mot_spg(:,w:w+size(syl_spg,2)-1);
            crosscoef(w)=0; norm1(w)=0; norm2(w)=0; crspg=[];
            MeanSpect1=mean(mean(abs(syl_spg(cg1:cg2,1:lspg)))); MeanSpect2=mean(mean(abs(pseudosyl_spg(cg1:cg2,1:lspg))));  
            for fr=cg1:cg2
                crosscoef(w)=crosscoef(w)+sum((abs(syl_spg(fr,1:lspg))-MeanSpect1).*(abs(pseudosyl_spg(fr,1:lspg))-MeanSpect2));
                norm1(w)=norm1(w)+sum((abs(syl_spg(fr,1:lspg))-MeanSpect1).^2);
                norm2(w)=norm2(w)+sum((abs(pseudosyl_spg(fr,1:lspg))-MeanSpect2).^2);
            end
            crossconorm(w)=crosscoef(w)/sqrt(norm1(w)*norm2(w));
        end
        [MaxCrossco,tmax]=max(crossconorm);
        AllSimilarity(i,j)=MaxCrossco;
        AllOffset(i,j)=tmax;
    end
end
  

