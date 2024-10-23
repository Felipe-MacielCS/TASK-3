%% Script mainScript3 to run runTwoParallelLinkSim() Function.
%
% Parameters:
% Ks - array for the number of packets (K)
% N - the number of simulations for each K
% p_vals - array of probabilities of failure for each transmission
% colors - array of colors for plot in K values
%
% Output: 
% Plots (Graphs) showing the simulated number of transmissions for different values of K and p
% - Individual plots for each K
% - Combined plot for all K values
%

% Values of K (number of packets)
Ks = [1, 5, 15, 50, 100];

% Number of simulations for each K
N = 1000;

% Range of probability of failure (p)
p_vals = linspace(0.01, 0.99, 50); % simulate across 50 values of p between 0.01 and 0.99

% Preallocate space for simulated results
simulatedResults = zeros(length(Ks), length(p_vals));

% Loop over each value of K to simulate and plot
for kIdx = 1:length(Ks)
    K = Ks(kIdx); % Select current value of K
    
    % Loop over each value of p to simulate transmissions
    for pIdx = 1:length(p_vals)
        p = p_vals(pIdx); % Select current value of failure probability
        
        % Simulate the result using runTwoParallelLinkSim() function
        simulatedResults(kIdx, pIdx) = runTwoParallelLinkSim(K, p, N);
    end

    % Plot results for current value of K
    figure; % Open a new figure
    hold on; % Hold plot for multiple graphs
    plot(p_vals, simulatedResults(kIdx, :), 'ro', 'MarkerSize', 5, 'DisplayName', 'Simulated');
    hold off; % Release plot hold
    
    % Add labels, title, and legend
    xlabel('Probability of Failure (p)');
    ylabel('Average Number of Transmissions');
    title(['Two Parallel Link Network - K = ', num2str(K)]);
    legend show; % Show the legend
    set(gca, 'YScale', 'log'); % Logarithmic scale for Y-axis for better readability

    % Save the figure as a PNG file (optional)
    saveas(gcf, ['TwoParallelLink_K_', num2str(K), '.png']);
end

% Plot combined results for all values of K
figure; % Open a new figure for combined plot
hold on; % Hold plot for multiple graphs
colors = {'b', 'g', 'r', 'c', 'm'}; % Different colors for each K

% Loop over each value of K to plot the results together
for kIdx = 1:length(Ks)
    K = Ks(kIdx); % Select current value of K
    
    % Plot the simulated results for the current K value
    plot(p_vals, simulatedResults(kIdx, :), 'o', 'MarkerSize', 5, 'Color', colors{kIdx}, 'DisplayName', ['Simulated K = ', num2str(K)]);
end

hold off; % Release plot hold

% Add labels, title, and legend for combined plot
xlabel('Probability of Failure (p)');
ylabel('Average Number of Transmissions');
title('Two Parallel Link Network - All K Values');
legend show; % Show the legend
set(gca, 'YScale', 'log'); % Logarithmic scale for Y-axis

% Save the combined figure as a PNG file (optional)
saveas(gcf, 'TwoParallelLink_AllK.png');
