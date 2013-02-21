function [value] = Utility(S, RW)

%two evaluation functions to make selection for white and red
value = 0;

if (RW == 0)
    for a=1:8
        for b=1:8
            if (mod(a+b,2)~=0)
                weight = 0;
                % simply count the total number of the pieces (subtract from  adversary)
                if ( S(b,a)==1+RW || S(b,a)==3+RW) %RW piece
                    weight = 1;
                    
                elseif ( S(b,a)==2+RW ) %RW piece
                    weight = -1;
                
                elseif ( S(b,a)==4 ) %RW piece
                    weight = -2;
                end
                value = value + weight;
            end 
        end  
    end 
end

if (RW == 1)
    offense = 0; % total value of 6
    for a=1:8
        for b=1:8
            if (mod(a+b,2)~=0)
                % count the total number of the pieces (subtract from  adversary)
                if ((S(b,a)==1+RW) || (S(b,a)==3+RW)) %RW piece
                    value = value + 16;
                end
                if ((S(b,a)==0+RW) || (S(b,a)==2+RW)) %RW piece
                    value = value - 16;
                end
                %This will make the white move forward positively. Or the
                %game will be hard to finish
                if ((S(b,a)==3+RW) || (S(b,a)==1+RW)) %RW piece
                    offense = offense + (8-b);
                end
            end
            value = value + offense;
        end  
    end
end
end