function [value] = Utility(S, RW)

%two evaluation functions to make selection for white and red
value = 0;

if (RW == 0)
    for a=1:8
        for b=1:8
            if (mod(a+b,2)~=0)
                weight = 0;
                % Count pieces on board and assign weight values
                if ( S(b,a)==1+RW || S(b,a)==3+RW) %friendly pawn piece
                    weight = 1;
                    
                elseif (S(b,a) == 3)%friendly king piece
                    weight = 2;
                    
                elseif ( S(b,a)==2+RW ) %enemy pawn piece
                    weight = -1;
                
                elseif ( S(b,a)==4 ) %enemy king piece
                    weight = -2;
                end

                %add utility for protected pieces
                     %pieces on the side
                     if ( (a ==1 || a==8 || b==1 || b==8) && (S(b,a) == 1 || S(b,a) == 3) )
                         weight = 0.4 + weight;
                     end  
                     %pieces with a piece diagonally behind it
                     
                %subtract utility for enemy protected pieces
                    %enemy pieces on the side
                     if ( (a ==1 || a==8 || b==1 || b==8) && (S(b,a) == 1 || S(b,a) == 3) )
                         weight = weight - 0.4;
                     end
                    %enemy pieces with a piece diagonaly behind it
                    
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