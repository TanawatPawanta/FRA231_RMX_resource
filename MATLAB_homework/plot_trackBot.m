function plot_trackBot(p,W)
%PLOT_TRACKBOT plot the animation of trackBot 
%   PLOT_TRACKBOT(P) plot the movement of the trackBot based on the given 
%   path P on a grid
%
%   PLOT_TRACKBOT(P,W) plot the movement of the trackBot based on the given 
%   path P and given walls W on a grid .

%{
 NAME           : plot_trackBot
 AUTHOR         : Thanacha Choopojcharoen
 DATE           : August 7th 2021
 MODIFIED BY    : -
%}
if isempty(p)
    error('The give path is empty.');
else
    dt = 0.1;
    if nargin == 2
        x_min = min([p(1,:) W(1,:)]);
        x_max = max([p(1,:) W(1,:)]);
        y_min = min([p(2,:) W(2,:)]);
        y_max = max([p(2,:) W(2,:)]);
    else
        x_min = min(p(1,:));
        x_max = max(p(1,:));
        y_min = min(p(2,:));
        y_max = max(p(2,:));
    end
    ax = axes;
    axis(ax,'equal');
    axis(ax,[x_min-1 x_max+1 y_min-1 y_max+1]);
    hold(ax,'on');
    for i = 0:(y_max-y_min)+1
        plot(ax,[x_min-1/2 x_max+1/2],[y_min-1/2+i y_min-1/2+i],'k')
    end
    for i = 0:(x_max-x_min)+1
        plot(ax,[x_min-1/2+i x_min-1/2+i],[y_min-1/2 y_max+1/2],'k')
    end
    for i = 1:size(p,2)
        if i == 1
            color = [0 1 0];
        elseif i == size(p,2)
            color = [1 0 0];
        else
            color = [1 1 0];
        end
        rectangle(ax,'Position',[p(1,i)-1/2,p(2,i)-1/2,1,1],'FaceColor',color)
    end
    if nargin == 2
        for i = 1:size(W,2)
            rectangle(ax,'Position',[W(1,i)-1/2,W(2,i)-1/2,1,1],'FaceColor',[0 0 0])
        end
    end
    
    for i = 1:size(p,2)
        if i~=1
            if all(p(:,i-1) == p(:,1))
                color = [0 1 0];
            elseif all(p(:,i-1) == p(:,end))
                color = [1 0 0];
            else
                color = [1 1 0];
            end
            rectangle(ax,'Position',[p(1,i-1)-1/2,p(2,i-1)-1/2,1,1],'FaceColor',color);
        end
        rectangle(ax,'Position',[p(1,i)-1/2,p(2,i)-1/2,1,1],'FaceColor',[0 0 1]);
        pause(dt)
    end
end