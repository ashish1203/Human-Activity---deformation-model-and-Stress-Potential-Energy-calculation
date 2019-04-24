readerobj = mmreader('shahar_run.avi', 'tag', 'myreader1');
vidFrames = read(readerobj);
numFrames = get(readerobj, 'numberOfFrames');
h=0;
w=0;
r=1;
m=1;
n=1;
clc;
%numFrames=45;
if (numFrames<45)
    numFrames=numFrames;
else numFrames=45;
end
for k=1:3
    
mov(k).cdata = vidFrames(:,:,:,k);
mov(k+1).cdata = vidFrames(:,:,:,k+1);
framediffs=mov(k+1).cdata-mov(k).cdata;
title('frame difference');
figure,imshow(framediffs);
F=rgb2gray(framediffs);
% level=graythresh(im);
% F=im2bw(im,level);
%F= medfilt2(F,[3 3]);
%figure,imshow(F);
%impixelinfo;
[height,width]=size(F);
F=imcrop(F,[1 48 width 74]);

f_head=imcrop(F,[1 1 width 15]);
%figure,imshow(f_head);
%title('head');
% impixelinfo;
%horizontal scanning in head
%horizontal scanning
%legs

%shoulder to waist
f_stow=imcrop(F,[1 15 width 20]);
%figure,imshow(f_stow);
%impixelinfo;
%title('shoulder to waist');

f_legs=imcrop(F,[1 35 width 30]);
%figure,imshow(f_legs);
%title('legs ');
diffs11=0;
diffs21=0;



[h w]=size(f_stow);

   b=1;
   d=1;
  
   
    for j=1:h-1
        for i=1:w-1
            diffs11=f_stow(j,i+1)-f_stow(j,i);
   
   
            if (diffs11==+1)
                coordinatesone(1,1)=i+1;
                coordinatesone(1,2)=j;
                
                cone(1,b)=coordinatesone(1,1);
             b=b+1;
                cone(1,b)=coordinatesone(1,2);
            
          end
           
        end
    end
    
  [s1 s2]=size(cone);
  cone;
  b;
  
  x1coordinates_bw(n)=cone(1,1);
  y1coordinates_bw(n)=cone(1,2);
  
  
  %    [x1 y1]=[x1coordinates_bw(k) y1coordinates_bw(k)];
    
    x2coordinates_bw(n)=cone(1,ceil(1*s2/2));
    y2coordinates_bw(n)=cone(1,ceil(1*s2/2));
    
   
    
    
    
   % [x2 y2]=[x2coordinates_bw(k) y2coordinates_bw(k)];
    
    
    x3coordinates_bw(n)=cone(1,s2);
    y3coordinates_bw(n)=cone(1,s2);
    
    
   n=n+1;
  % [x3 y3]=[x3coordinates_bw(k) y3coordinates_bw(k)];
    
   
    
    
    
%     for j=1:h-1
%         for i=1:w-1
%             diffs21=f_stow(j,i+1)-f_stow(j,i);
%             
%             if (diffs2==-1)
%                 coordinatestwo(1,1)=i+1;
%                 coordinatestwo(1,2)=j;
%                 
%                 ctwo{1,d}=[coordinatestwo];
%              d=d+1;
%             
%           end
%            
%         end
%     end
    
%    disp(sprintf(' %d ',xcoordinates_bw(k)));
   % [s1 s2]=size(cone);
%disp('the black to white gradient coordinates are:');
% cone{1,1};
% cone{1,ceil(s2/2)};
% cone{1,s2};
%a1=[cone{1,1};cone{1,2}];
      
    %[s3 s4]=size(ctwo);
%disp('the white to black gradient coordinates are:');
% ctwo{1,1};
% ctwo{1,ceil(s4/2)};
% ctwo{1,s4};
%a2=[ctwo{1,1};ctwo{1,2}];


end
n=n-1;

for g=1:n-1
%disp(sprintf(' the frame number %d  and %d results are',g,g+1));    
displace_x1coordinates_bw(g)=x1coordinates_bw(g+1)-x1coordinates_bw(g);
displace_y1coordinates_bw(g)=y1coordinates_bw(g+1)-y1coordinates_bw(g);

displace_x2coordinates_bw(g)=x2coordinates_bw(g+1)-x2coordinates_bw(g);
displace_y2coordinates_bw(g)=y2coordinates_bw(g+1)-y2coordinates_bw(g);

displace_x3coordinates_bw(g)=x3coordinates_bw(g+1)-x3coordinates_bw(g);
displace_y3coordinates_bw(g)=y3coordinates_bw(g+1)-y3coordinates_bw(g);


% sum1=(displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g));
% sum2=(displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g)) ;
% sum3=(displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g));
% sum= sum1  +  sum2 +  sum3;

%for displacement in x direction

e_x(1,1)  = (displace_x1coordinates_bw(g)/x1coordinates_bw(g)) + (displace_x1coordinates_bw(g)/y1coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g)))

e_x(1,2)  = (displace_x1coordinates_bw(g)/x2coordinates_bw(g)) + (displace_x2coordinates_bw(g)/y1coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x1coordinates_bw(g) * y2coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x1coordinates_bw(g) * y2coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x1coordinates_bw(g) * y2coordinates_bw(g)))

e_x(1,3)  = (displace_x1coordinates_bw(g)/x3coordinates_bw(g)) + (displace_x3coordinates_bw(g)/y1coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x1coordinates_bw(g) * y3coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x1coordinates_bw(g) * y3coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x1coordinates_bw(g) * y3coordinates_bw(g)));

e_x(2,1)  = (displace_x2coordinates_bw(g)/x1coordinates_bw(g)) + (displace_x1coordinates_bw(g)/y2coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x2coordinates_bw(g) * y1coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x2coordinates_bw(g) * y1coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x2coordinates_bw(g) * y1coordinates_bw(g)));

e_x(2,2)  = (displace_x2coordinates_bw(g)/x2coordinates_bw(g)) + (displace_x2coordinates_bw(g)/y2coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x2coordinates_bw(g) * y2coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x2coordinates_bw(g) * y2coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x2coordinates_bw(g) * y2coordinates_bw(g)));

e_x(2,3)  = (displace_x2coordinates_bw(g)/x3coordinates_bw(g)) + (displace_x3coordinates_bw(g)/y2coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x2coordinates_bw(g) * y3coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x2coordinates_bw(g) * y3coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x2coordinates_bw(g) * y3coordinates_bw(g)));

e_x(3,1)  = (displace_x3coordinates_bw(g)/x1coordinates_bw(g)) + (displace_x1coordinates_bw(g)/y3coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x3coordinates_bw(g) * y1coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x3coordinates_bw(g) * y1coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x3coordinates_bw(g) * y1coordinates_bw(g)));

e_x(3,2)  = (displace_x3coordinates_bw(g)/x2coordinates_bw(g)) + (displace_x2coordinates_bw(g)/y3coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x3coordinates_bw(g) * y2coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x3coordinates_bw(g) * y2coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x3coordinates_bw(g) * y2coordinates_bw(g)));

e_x(3,3)  = (displace_x3coordinates_bw(g)/x3coordinates_bw(g)) + (displace_x3coordinates_bw(g)/y3coordinates_bw(g)) + ((displace_x1coordinates_bw(g) * displace_x1coordinates_bw(g))/(x3coordinates_bw(g) * y3coordinates_bw(g))) +((displace_x2coordinates_bw(g) * displace_x2coordinates_bw(g))/(x3coordinates_bw(g) * y3coordinates_bw(g))) +((displace_x3coordinates_bw(g) * displace_x3coordinates_bw(g))/(x3coordinates_bw(g) * y3coordinates_bw(g)));
        
e_x;
eigen_x=[eig(e_x)]
%disp(eigen_x(1));
%figure,plot(eigen);

%now begins the displacement in y direction part

e_y(1,1)  = (displace_y1coordinates_bw(g)/x1coordinates_bw(g)) + (displace_y1coordinates_bw(g)/y1coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x1coordinates_bw(g) * y1coordinates_bw(g)));

e_y(1,2)  = (displace_y1coordinates_bw(g)/x2coordinates_bw(g)) + (displace_y2coordinates_bw(g)/y1coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x1coordinates_bw(g) * y2coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x1coordinates_bw(g) * y2coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x1coordinates_bw(g) * y2coordinates_bw(g)));

e_y(1,3)  = (displace_y1coordinates_bw(g)/x3coordinates_bw(g)) + (displace_y3coordinates_bw(g)/y1coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x1coordinates_bw(g) * y3coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x1coordinates_bw(g) * y3coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x1coordinates_bw(g) * y3coordinates_bw(g)));

e_y(2,1)  = (displace_y2coordinates_bw(g)/x1coordinates_bw(g)) + (displace_y1coordinates_bw(g)/y2coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x2coordinates_bw(g) * y1coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x2coordinates_bw(g) * y1coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x2coordinates_bw(g) * y1coordinates_bw(g)));

e_y(2,2)  = (displace_y2coordinates_bw(g)/x2coordinates_bw(g)) + (displace_y2coordinates_bw(g)/y2coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x2coordinates_bw(g) * y2coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x2coordinates_bw(g) * y2coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x2coordinates_bw(g) * y2coordinates_bw(g)));

e_y(2,3)  = (displace_y2coordinates_bw(g)/x3coordinates_bw(g)) + (displace_y3coordinates_bw(g)/y2coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x2coordinates_bw(g) * y3coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x2coordinates_bw(g) * y3coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x2coordinates_bw(g) * y3coordinates_bw(g)));

e_y(3,1)  = (displace_y3coordinates_bw(g)/x1coordinates_bw(g)) + (displace_y1coordinates_bw(g)/y3coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x3coordinates_bw(g) * y1coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x3coordinates_bw(g) * y1coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x3coordinates_bw(g) * y1coordinates_bw(g)));

e_y(3,2)  = (displace_y3coordinates_bw(g)/x2coordinates_bw(g)) + (displace_y2coordinates_bw(g)/y3coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x3coordinates_bw(g) * y2coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x3coordinates_bw(g) * y2coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x3coordinates_bw(g) * y2coordinates_bw(g)));

e_y(3,3)  = (displace_y3coordinates_bw(g)/x3coordinates_bw(g)) + (displace_y3coordinates_bw(g)/y3coordinates_bw(g)) + ((displace_y1coordinates_bw(g) * displace_y1coordinates_bw(g))/(x3coordinates_bw(g) * y3coordinates_bw(g))) +((displace_y2coordinates_bw(g) * displace_y2coordinates_bw(g))/(x3coordinates_bw(g) * y3coordinates_bw(g))) +((displace_y3coordinates_bw(g) * displace_y3coordinates_bw(g))/(x3coordinates_bw(g) * y3coordinates_bw(g)));

e_y;


%delS is the surface associated with deformation
%finding out strain energy

delS=h*w;
mass=1;
time=1;
STRAIN_ENERGY(m)=((e_x(1,1)+ e_x(1,2) + e_x(1,3) + e_x(2,1) + e_x(2,2) + e_x(2,3) + e_x(3,1) + e_x(3,2) + e_x(3,3))*delS)/10000;
disp(STRAIN_ENERGY(m));

%finding out potential enrgy

POTENTIAL_ENERGY(m)=displace_x1coordinates_bw(g)+ displace_x2coordinates_bw(g)+ displace_x3coordinates_bw(g);
%disp(POTENTIAL_ENERGY(m));
m=m+1;



end