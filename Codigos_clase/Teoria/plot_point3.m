% PLOT_POINT3 - Plots a point in three-dimensional space with customizable options.
% 
%    PLOT_POINT3(COORDINATES) plots a point in 3D space with given coordinates.
% 
%    PLOT_POINT3(COORDINATES, 'PropertyName', PropertyValue, ...) allows customization
%    of the appearance of the point with various options.
% 
%    Input arguments:
%       COORDINATES: A 3-element vector representing the coordinates [x, y, z].
% 
%    Optional properties (specified as 'Name', Value pairs):
%       'Marker': Specifies the marker to use (e.g., 'o', '^', '*').
%       'Label': Label text for the point.
%       'Color': Specifies the color of the point (e.g., 'r', 'g', 'b').
% 
%    Example:
%       % Define the coordinates of the point
%       coordinates = [1, 2, 3];
% 
%       % Specify custom options
%       marker = '^';
%       label = 'Test Point';
%       color = 'r';
% 
%       % Call the function with all options
%       plot_point3(coordinates, 'Marker', marker, 'Label', label, 'Color', color);
% 
%    See also: PLOT3, TEXT, XLABEL, YLABEL, ZLABEL, GRID

function plot_point3(coordinates, varargin)
    x = coordinates(1);
    y = coordinates(2);
    z = coordinates(3);

    % Set default values for options
    marker = 'o';
    label = '';
    color = 'b';

    % Update options with input values
    for i = 1:2:length(varargin)
        switch varargin{i}
            case 'Marker'
                marker = varargin{i+1};
            case 'Label'
                label = varargin{i+1};
            case 'Color'
                color = varargin{i+1};
        end
    end

    % Plot point
    plot3(x, y, z, marker, 'Color', color);
    xlabel('x');
    ylabel('y');
    zlabel('z');
    grid on;

    % Add label
    if ~isempty(label)
        text(x, y, z, label);
    end
end
