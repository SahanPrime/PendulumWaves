% Single-Pivot Pendulum Wave (The "Fan" Effect)
clear; close all; clc;

%% --- 1. Parameters ---
g = 9.81;
num_pendulums = 15;
duration = 200;         % Increased duration (Cycle time)

% To keep lengths realistic (0.2m to 1m), we need higher oscillation counts
% because the duration is so long.
% Let's say the longest pendulum has a period of ~2.0 seconds.
% N = duration / Period = 200 / 2 = 100 oscillations.
N_longest = 100;        

initial_angle = deg2rad(20); % Release angle

%% --- 2. Physics Calculations ---
indices = 1:num_pendulums;

% Frequency Calculation for Wave Pattern
% Shortest (k=1) does N+14 cycles, Longest (k=15) does N cycles
cycles_vector = N_longest + (num_pendulums - indices);
freqs = cycles_vector / duration;

% Calculate Lengths specifically to match these frequencies
% T = 1/f = 2*pi*sqrt(L/g)  -->  L = g / (2*pi*f)^2
L = g ./ (2 * pi * freqs).^2;

%% --- 3. Visualization Setup (Front View) ---
f = figure('Color', 'k', 'Name', 'Single Pivot Wave');
ax = gca;
set(ax, 'Color', 'k', 'XColor', 'w', 'YColor', 'w');
hold on; axis equal; grid on; box on;

% Adjust limits to fit the longest pendulum
max_L = max(L);
xlim([-max_L*sin(initial_angle)*1.5, max_L*sin(initial_angle)*1.5]);
ylim([-max_L*1.1, 0.1]);

title(['Single Pivot Wave (Duration: ' num2str(duration) 's)'], 'Color', 'w');
xlabel('Horizontal Position (m)', 'Color', 'w');
ylabel('Vertical Position (m)', 'Color', 'w');

% Colors
colors = jet(num_pendulums);

% Graphics Objects
% We draw the pivot point once
plot(0, 0, 'w+', 'MarkerSize', 10, 'LineWidth', 2);

lines = gobjects(1, num_pendulums);
bobs = gobjects(1, num_pendulums);

for k = 1:num_pendulums
    % Initialize lines and bobs
    lines(k) = plot([0, 0], [0, -L(k)], 'Color', [colors(k,:) 0.5], 'LineWidth', 1);
    bobs(k) = plot(0, -L(k), 'o', ...
                   'MarkerSize', 8, 'MarkerFaceColor', colors(k,:), ...
                   'MarkerEdgeColor', 'none');
end

%% --- 4. Animation Loop ---
dt = 0.05; 
time_vector = 0:dt:duration;

fprintf('Simulating Single Pivot Wave... Watch them unravel!\n');

for t = time_vector
    
    % --- Physics ---
    % Calculate angle: theta = theta0 * cos(2*pi*f*t)
    theta = initial_angle * cos(2 * pi * freqs * t);
    
    % --- Coordinates (Polar to Cartesian) ---
    % Pivot is at (0,0) for everyone
    x_pos = L .* sin(theta);
    y_pos = -L .* cos(theta);
    
    % --- Update Graphics ---
    for k = 1:num_pendulums
        set(lines(k), 'XData', [0, x_pos(k)], 'YData', [0, y_pos(k)]);
        set(bobs(k), 'XData', x_pos(k), 'YData', y_pos(k));
    end
    
    drawnow;
    pause(dt); 
end