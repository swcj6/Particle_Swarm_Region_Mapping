% -------------------------------------------------------------------------
% Name: Steven Wu
% Date: March 26, 2025
% Santa Clara University
% MECH 293
% Project One: Particle swarm modeling
% -------------------------------------------------------------------------

clearvars

Nm = 100;
Nt = 100;
No = 100;
% Initialize swarm
swarm.memberMass = 3;
swarm.numMembers = Nm;
swarm.maxSpeed = 100;
swarm.thrust = 1e6;
swarm.initDomain = [10 10 10];
swarm.targetArrivalTol = 5;
swarm.obstacleImpactTol = 5;

% Initialize targets
target.numMembers = Nt;
target.initDomain = [500 500 10];

% Initialize obstacles
obstacle.numMembers = No;
obstacle.initDomain = [500 500 10];

% Imitialize design parameters
designParams = [8 7 1 0.3 0.6 0.6 0.8 0.3 0.8 0.1 0.5 1.0 0.8 0.9 0.6];

% Initialize simulation details
totalTime = 13;
timeStep = 1e-2;
numSteps = totalTime/timeStep;
currentTime = 0;
F = struct('cdata', cell(1,numSteps), 'colormap', cell(1,numSteps));

% Initialize the dynamic data 
[swarm, target, obstacle] = initializeKinematics(swarm, target, obstacle);

% Create a movie file and open it
movieName = ['swarmSize_', num2str(swarm.numMembers), '_targets_',...
    num2str(target.numMembers), '_obstacles_', num2str(obstacle.numMembers), '.mp4'];
v = VideoWriter(movieName, 'MPEG-4');
open(v)


for n = 1:numSteps
    for i = 1:swarm.numMembers
        if swarm.memberActive(i)
            
            % Compute Member-Target interaction
            [swarm, target] = getMemTargetInteraction_S(i, swarm, target, designParams);
            
            % Compute Member-Obstacle interaction
            swarm = getMemObstacleInteraction_S(i, swarm, obstacle, designParams);
            
            % Compute Member-Member interaction
            swarm = getMemMemberInteraction_S(i, swarm, designParams);
            
            % Compute acceleration
            swarm = getSwarmAccel_S(i, swarm, designParams);
            
            % Update velocity and position
            swarm = updateSwarmPosition_S(i, swarm, timeStep);
            
            % Check for obstacle impact
            swarm = checkObstacleImpact_S(i, swarm, obstacle);
            
        end
    end
    

    % Update time
    currentTime = currentTime + timeStep;
    
    % Plot simulation state and record movie frame
    F(n) = getPlots(swarm, target, obstacle, currentTime);
    writeVideo(v, F(n));
    
end

% Close video file
close(v)
