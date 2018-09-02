function[CA, CH, CV, CD]=wavellet(B)
  row=size(B,1);
  col=size(B,2);
  b1=mod(row,2);
  r=(row-b1)/2;
  b2=mod(col,2);  
  c=(col-b2)/2;
  %CA-LL, CH=HL, CV=LH, CD=HH
    CA=double(ones(r,c));
    CH=double(ones(r,c));
    CV=double(ones(r,c));
    CD=double(ones(r,c));

        x=1;
        y=1;
        for i=1:2:row-2-b1
            for j=1:2:col-2-b2
                ll=(B(i,j)+B(i,j+1)+B(i+1,j)+B(i+1,j+1))/2;
                hl=(B(i,j)+B(i,j+1)-B(i+1,j)-B(i+1,j+1))/2;
                lh=(B(i,j)-B(i,j+1)+B(i+1,j)-B(i+1,j+1))/2;
                hh=(B(i,j)-B(i,j+1)-B(i+1,j)+B(i+1,j+1))/2;
                CA(x,y)=ll;
                CH(x,y)=hl;
                CV(x,y)=lh;
                CD(x,y)=hh;
                y=y+1;
                if(y>(row-b1)/2)
                    y=1;
                    x=x+1;
                end
            end
        end
