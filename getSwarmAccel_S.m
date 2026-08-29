function swarm = getSwarmAccel_S(i, swarm, designParams)

W_mt = designParams(1);
W_mo = designParams(2);
W_mm = designParams(3);

% Normalized direction swarm member i should move towards

rawDir =  W_mt * swarm.targetDir(i,:) + W_mo * swarm.obstacleDir(i,:) + W_mm * swarm.memberDir(i,:);
weightedDir = rawDir / norm(rawDir);

% Swarm member i acceleration
swarm.memberAcceleration(i,:) = (swarm.thrust * weightedDir) / swarm.memberMass;
end
