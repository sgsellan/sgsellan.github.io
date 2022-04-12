x = linspace(-2.4,2.1,2000); % Create 100 points between -2.5 and 2.5
y = x+0.3;
[X,Y] = meshgrid(x,y);
P = X(:) + Y(:).*1i;
pts = [0.2+1i,-0.2-1i;0.1+1.5i,-0.6-0.5i;0.3+0.3i,-0.7-0.7i];
f = @(z) ((pts(1,1)-z)./(pts(1,2)-z)).*((pts(2,1)-z)./(pts(2,2)-z)).*((pts(3,1)-z)./(pts(3,2)-z));
Q = @(z) [((pts(1,1)-z)./(pts(1,2)-z)),((pts(2,1)-z)./(pts(2,2)-z)),((pts(3,1)-z)./(pts(3,2)-z))];
f1 = @(z) imag(log(prod(Q(z),2)));
f2 = @(z) imag(sum(log(Q(z)),2));
Z = f1(P);

num_lines = 700;
CM = flipud(cbrewer('Reds',num_lines+1)); % I like this colormap
surf(-X,-Y,reshape(Z,size(X)),'CData',reshape(Z,size(X)),fsoft,fphong,falpha(1,0));
view([0 90]);
axis equal;
%CM(1:2:end,:) = 0.9*CM(1:2:end,:); % Add greyed out lines every two lines so that we see other levelsets
colormap(CM)
caxis([-pi pi])
%colorbar
axis off
grid off
set(gcf,'Color','w');
drawnow
