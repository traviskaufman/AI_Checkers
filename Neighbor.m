function [NG] = Neighbor(a,b,d,RW,FB)

NG=zeros(2,1);
neig=mod(RW+FB,2); %which neighbor to get
if (d==0) 
    if (neig==1)
        if ((a+1 < 9) && (b+1<9))
            NG(1)=a+1;
            NG(2)=b+1;
        else
            NG=0;
        end
    else
        if ((a-1 > 0) && (b-1 > 0))
            NG(1)=a-1;
            NG(2)=b-1;
        else
            NG=0;
        end
    end
else
    if (neig==1)
        if ((a-1 > 0) && (b+1 < 9))
            NG(1)=a-1;
            NG(2)=b+1;
        else
            NG=0;
        end
    else
        if ((a+1 < 9) && (b-1 > 0))
            NG(1)=a+1;
            NG(2)=b-1;
        else
            NG=0;
        end
    end   
end
