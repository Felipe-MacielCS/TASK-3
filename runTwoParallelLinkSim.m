%% Function runTwoParallelLinkSim()
% Parameters
% K - the number of packets in the application message
% p - the probability of failure for each link
% N - the number of simulations to run
%
% Returns: the average number of transmissions required across the two parallel link network

function result = runTwoParallelLinkSim(K, p, N)
    simResults = ones(1, N); % Store results for each simulation

    for i = 1:N
        txAttemptCount = 0; % total number of transmission attempts
        pktSuccessCount = 0; % number of packets that successfully made it through either of the two links

        while pktSuccessCount < K
            r1 = rand; % Random value for Link 1
            r2 = rand; % Random value for Link 2
            txAttemptCount = txAttemptCount + 1; % Count initial transmission attempt

            % Check if either link succeeds (r1 > p or r2 > p)
            if r1 > p || r2 > p
                pktSuccessCount = pktSuccessCount + 1; % Packet successfully transmitted through either link
            end
        end

        simResults(i) = txAttemptCount; % Store the total number of attempts for this simulation
    end

    result = mean(simResults); % Return the average number of transmissions over N simulations
end
