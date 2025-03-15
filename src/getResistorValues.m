function R = getResistorValues()
    % Returns the resistor values for each folding stage
    R = [
        10e3, 100e3, 100e3;    % Folding cell 1
        49.9e3, 100e3, 43.2e3; % Folding cell 2
        91e3, 100e3, 56e3;     % Folding cell 3
        30e3, 100e3, 68e3;     % Folding cell 4
        68e3, 100e3, 33e3      % Folding cell 5
    ];
end
