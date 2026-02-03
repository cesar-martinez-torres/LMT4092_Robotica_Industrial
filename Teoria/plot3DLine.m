function plot3DLine(p1, p2, varargin)
    % plot3DLine - Draws a 3D line between two points
    % 
    % Syntax:
    %   plot3DLine(p1, p2)                  -> Draws a black line with width 1
    %   plot3DLine(p1, p2, 'LineWidth', 2)  -> Draws a line with width 2
    %   plot3DLine(p1, p2, 'Color', 'r')    -> Draws a red line
    %   plot3DLine(p1, p2, 'LineWidth', 3, 'Color', 'b') -> Draws a blue line with width 3
    % 
    % Parameters:
    %   p1, p2 - Column vectors representing coordinates of the points [x; y; z]
    %   'LineWidth' - Line width (optional, default value: 1)
    %   'Color' - Line color (optional, default value: 'k')
    
    % Default values
    defaultLineWidth = 1;
    defaultColor = 'k';
    
    % Parse optional arguments
    p = inputParser;
    addParameter(p, 'LineWidth', defaultLineWidth, @(x) isnumeric(x) && x > 0);
    addParameter(p, 'Color', defaultColor);
    parse(p, varargin{:});
    
    % Extract argument values
    lineWidth = p.Results.LineWidth;
    lineColor = p.Results.Color;
    
    % Ensure p1 and p2 are column vectors
    if size(p1,2) > 1 || size(p2,2) > 1
        error('p1 and p2 must be column vectors of size [3x1]');
    end
    
    % Extract coordinates
    x = [p1(1); p2(1)];
    y = [p1(2); p2(2)];
    z = [p1(3); p2(3)];
    
    % Draw the line
    plot3(x, y, z, 'Color', lineColor, 'LineWidth', lineWidth);
    grid on;
    xlabel('X'); ylabel('Y'); zlabel('Z');
    hold on;
end
