clear
global SAT_params
n1=7; n2=7; CondName={'pre'; 'early post'; 'crist'}; % ; 'post late'

% Lesions électrolytiques
Tut{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 1\tuteur\';
Juv{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 1\5.21 lesion\';

Tut{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 2\tuteur\';
Juv{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 2\3.26 lesion\';

Tut{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 3\tuteur\';
Juv{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 3\4.22 lesion\';

Tut{4}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 4\tuteur\';
Juv{4}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 4\11.1 lesion\';

Tut{5}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 5\tuteur\';
Juv{5}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 5\10.2 lesion\';

Tut{6}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 6\tuteur\';
Juv{6}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 6\11.4 lesion\';

Tut{7}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 7\tuteur\';
Juv{7}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 7\10.5 lesion\';

for i=1:7
    for cond=3:-1:1
        cd1=Tut{i}; cd2=([Juv{i} CondName{cond} '\songs\']);
        [AllSimilarity,AllOffset,files,indexes]=SpectralSimSimilarity(cd1,cd2,n1,n2);
        cd('../../..')
        save(['SpectralSimSimilarity_Songs_' CondName{cond}],'AllSimilarity','AllOffset','files','indexes','SAT_params')
    end
end
    
clear Tut Juv AllSimilarity AllOffset
% Lesions chimiques
Tut{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\autres leses\10.6\tuteur\';
Juv{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\autres leses\10.6\';

Tut{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\autres leses\11.5\tuteur\';
Juv{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\autres leses\11.5\';

Tut{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\autres leses\12.7\tuteur\';
Juv{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\autres leses\12.7\';

for i=1:3
    for cond=3:-1:1
%         cd1=Tut{i}; cd2=([Juv{i} CondName{cond} '\songs\']);
        cd1=Tut{i}; cd2=([Juv{i} CondName{cond} '\']);
        [AllSimilarity,AllOffset,files,indexes]=SpectralSimSimilarity(cd1,cd2,n1,n2);
        cd('..')
        save(['SpectralSimSimilarity_Songs_' CondName{cond}],'AllSimilarity','AllOffset','files','indexes','SAT_params')
    end
end
    
clear Tut Juv
% Control
Tut{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 3\tuteur\';
Juv{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 3\2.31 control\';

Tut{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 5\tuteur\';
Juv{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 5\12.2 control\';

% Tut{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 7\tuteur\';
% Juv{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 7\3.32 control\';

for i=1:2
    for cond=3:-1:1
        cd1=Tut{i}; cd2=([Juv{i} CondName{cond} '\songs\' ]);
        [AllSimilarity,AllOffset,files,indexes]=SpectralSimSimilarity(cd1,cd2,n1,n2);
        cd('../../..')
        save(['SpectralSimSimilarity_Cont_Songs_' CondName{cond}],'AllSimilarity','AllOffset','files','indexes','SAT_params')
    end
end

clear Tut Juv
Tut{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 1\tuteur\';
Juv{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 1\5.22 control\';

Tut{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 2\tuteur\';
Juv{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 2\5.25 control\';

Tut{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 4\tuteur\';
Juv{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Family 4\13.1 control\';

for i=1:3
    cond=3;
    cd1=Tut{i}; cd2=([Juv{i} CondName{cond} '\songs\' ]);
    [AllSimilarity,AllOffset,files,indexes]=SpectralSimSimilarity(cd1,cd2,n1,n2);
    cd('../../..')
    save(['SpectralSimSimilarity_Cont_Songs_' CondName{cond}],'AllSimilarity','AllOffset','files','indexes','SAT_params')
end
 

% Shams: 
Tut{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\1.51\tuteur\';
Juv{1}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\1.51\';

Tut{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\2.53\tuteur\';
Juv{2}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\2.53\';

Tut{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\4.40\tuteur\';
Juv{3}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\4.40\';

Tut{4}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\4.42\tuteur\';
Juv{4}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\4.42\';

Tut{5}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\5.55\tuteur\';
Juv{5}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\5.55\';

Tut{6}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\4.41\tuteur\';
Juv{6}='C:\Users\Arthur\OneDrive\Bureau\Lesion and Control Data - triés\Shams\4.41\';

for i=1:6
    for cond=3:-1:1
        cd1=Tut{i}; cd2=([Juv{i} CondName{cond} '\songs\' ]);
        [AllSimilarity,AllOffset,files,indexes]=SpectralSimSimilarity(cd1,cd2,n1,n2);
        cd('../..')
        save(['SpectralSimSimilarity_Cont_Songs_' CondName{cond}],'AllSimilarity','AllOffset','files','indexes','SAT_params')
    end
end
