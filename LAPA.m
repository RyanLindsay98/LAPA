%Ryan Lindsay 
%101038101


iter = 1000;

nx = 50;
ny = 50;
dx = 1;
dy = 1;


Vi = zeros(nx,ny);
V = zeros(nx,ny);  
Ex = zeros(nx,ny);
Ey = zeros(nx,ny);


Vi(:,1) = 1; 
Vi(:,nx) = 0; 

j=2:nx-1;
i=2:ny-1;
m=1:nx-1;
n=1:ny-1;
for t = 1: iter
    V = Vi; 
    
    
    %Iterative Equation
    Vi(i,j)=((dy^2*(V(i+1,j)+V(i-1,j)))+(dx^2*(V(i,j+1)+V(i,j-1))))/(2*(dx^2+dy^2));
   
    %Redefining boundaries in loop
    Vi(:,1) = 1; 
    Vi(:,nx) = 1;
   
    %E Field Equations 
    Ex(m,n) = -(Vi(m+1,n)-Vi(m,n))/dx;
    Ey(m,n) = -(Vi(m,n+1)-Vi(m,n))/dy;
   
   %Creating a Movie
    if mod(t, 10) == 0
    
        
    %Plotting 2D Laplace 
    figure (1)
    surf(V(i,j))
    title '2D Laplace'
    xlabel 'nx'
    ylabel 'ny' 
    zlabel 'V'
    pause(0.05)
    
    % Plotting E Field 
    figure(2) 
    surf(Ex,Ey)
    title 'E Field Plot'
    
    
    % PLotting Vector Field 
    figure(3)
    quiver(Ex,Ey,10)
    title 'Vector Field'
    
    
    end
    
    
    
end