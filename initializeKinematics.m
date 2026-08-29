function [swarm, target, obstacle] = initializeKinematics(swarm, target, obstacle)

% Initialize swarm kinematic quantities
swarm.memberAcceleration = zeros(swarm.numMembers,3);
swarm.memberVelocity = zeros(swarm.numMembers,3);
swarm.memberPosition = zeros(swarm.numMembers,3);
swarm.memberActive = ones(swarm.numMembers,1);
swarm.targetDir = zeros(swarm.numMembers,3);
swarm.obstacleDir = zeros(swarm.numMembers,3);
swarm.memberDir = zeros(swarm.numMembers,3);

swarm.memberPosition(:,1) = rand(swarm.numMembers,1)*swarm.initDomain(1);
swarm.memberPosition(:,2) = rand(swarm.numMembers,1)*swarm.initDomain(2);
swarm.memberPosition(:,3) = rand(swarm.numMembers,1)*swarm.initDomain(3);

% Initialize target kinematic quantities
target.memberPosition = zeros(target.numMembers,3);
target.memberActive = ones(target.numMembers,1);
target.memberPosition(:,1) = rand(target.numMembers,1)*target.initDomain(1);
target.memberPosition(:,2) = rand(target.numMembers,1)*target.initDomain(2);
target.memberPosition(:,3) = rand(target.numMembers,1)*target.initDomain(3);

% Initialize obstacle kinematic quantities
obstacle.memberPosition = zeros(obstacle.numMembers,3);
obstacle.memberActive = ones(obstacle.numMembers,1);
obstacle.memberPosition(:,1) = rand(obstacle.numMembers,1)*obstacle.initDomain(1);
obstacle.memberPosition(:,2) = rand(obstacle.numMembers,1)*obstacle.initDomain(2);
obstacle.memberPosition(:,3) = rand(obstacle.numMembers,1)*obstacle.initDomain(3);


end