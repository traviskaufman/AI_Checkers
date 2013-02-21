function [value] = Utility(S, RW)

%two evaluation functions to make selection for white and red
value = 0;

if (RW == 0)
    for column=1:8
        for row=1:8
            if (mod(column+row,2)~=0)
                weight = 0;
                piece = S(row,column);
                
                %define pieces while obeying boundary conditions
                if (row == 1 || row ==8 || column==1 || column ==8)
                    
                    %Top Left Boundary condition
                    if( row ==1 || column ==1)
                        pieceTopLeft = 0;
                    else
                        pieceTopLeft=S(row-1,column-1);
                    end
                    
                    %Top Right boundary condition
                    if ( row ==1 || column == 8)
                        pieceTopRight = 0;
                    else
                        pieceTopRight = S(row-1, column+1);
                    end
                    
                    %Bottom left boundary condition
                    if (row == 8 || column ==1)
                        pieceBottomLeft = 0;
                    else
                        pieceBottomLeft = S(row+1, column -1);
                    end
                    
                    %bottom right boundary condition
                    if ( row ==8 || column == 8)
                        pieceBottomRight = 0;
                    else
                        pieceBottomRight = S(row+1,column+1);
                    end
                    
                end
            
                % Count pieces and assign weight values
                if ( piece ==1 || piece ==3) %friendly pawn piece
                    weight = 1;
                    
                elseif (piece == 3)%friendly king piece
                    weight = 2;
                    
                elseif ( piece == 2 ) %enemy pawn piece
                    weight = -1;
                
                elseif ( piece == 4 ) %enemy king piece
                    weight = -2;
                end

                %add utility for protected pieces
                    
                    %pieces on the side
                     if ( (column ==1 || column==8 || row==1 || row==8) && (piece == 1 || piece == 3) )
                         weight = 0.4 + weight;
                     end
                     
                     %pieces with column piece diagonally behind it
                     if( (piece == 1 || piece ==3) &&(pieceTopLeft == 1 || pieceTopLeft ==3))
                         weight = 0.2 + weight;
                     elseif ( (piece == 1 || piece ==3) && (pieceTopRight == 1 || pieceTopRight ==3))
                         weight = 0.2 + weight;
                     %utility bonus if it is protected with 2 pieces
                     elseif ( (piece == 1 || piece ==3) && (pieceTopLeft == 1 || pieceTopLeft ==3) && (pieceTopRight == 1 || pieceTopRight ==3))
                         weight = 0.2 + weight;
                     end
                     
                %subtract utility for enemy protected pieces
                    
                    %enemy pieces on the side
                     if ( (column ==1 || column==8 || row==1 || row==8) && (piece == 2 || piece == 4) )
                         weight = weight - 0.4;
                     end
                     
                     %enemy pieces with a piece diagonaly behind it
                     if( (piece == 2 || piece ==4) &&(pieceBottomLeft == 2 || pieceBottomLeft ==4))
                         weight = 0.2 - weight;
                     elseif ( (piece == 2 || piece ==4) && (pieceBottomRight == 2 || pieceBottomRight ==4))
                         weight = 0.2 - weight;
                     %utility bonus if it is protected with 2 pieces
                     elseif ( (piece == 2 || piece ==4) && (pieceBottomLeft == 2 || pieceBottomLeft ==4) && (pieceBottomRight == 2 || pieceTopRight ==4))
                         weight = 0.2 - weight;
                     end
                    
                 %adjust value for weight of all utilities
                 value = value + weight;
                
            end 
        end  
    end 
end

if (RW == 1)
    offense = 0; % total value of 6
    for column=1:8
        for row=1:8
            if (mod(column+row,2)~=0)
                % count the total number of the pieces (subtract from  adversary)
                if ((S(row,column)==1+RW) || (S(row,column)==3+RW)) %RW piece
                    value = value + 16;
                end
                if ((S(row,column)==0+RW) || (S(row,column)==2+RW)) %RW piece
                    value = value - 16;
                end
                %This will make the white move forward positively. Or the
                %game will be hard to finish
                if ((S(row,column)==3+RW) || (S(row,column)==1+RW)) %RW piece
                    offense = offense + (8-row);
                end
            end
            value = value + offense;
        end  
    end
end
end