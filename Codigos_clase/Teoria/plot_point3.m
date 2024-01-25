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
