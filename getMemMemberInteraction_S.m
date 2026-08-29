function swarm = getMemMemberInteraction(i, swarm, designParams)

w_m1 = designParams(8);
w_m2 = designParams(9);
c1 = designParams(14);
c2 = designParams(15);

direction = zeros(swarm.numMembers, 3);
weightedDirection = zeros(swarm.numMembers, 3);
directionMagnitude = zeros(swarm.numMembers, 1);

sum = zeros(1,3);

for j = 1:swarm.numMembers
    if swarm.memberActive(j) && j ~= i
        
        % Distance vector from swarm member i to swarm member j
        direction(j,:) = swarm.memberPosition(j,:) - swarm.memberPosition(i,:);
        
        % Scalar distance from swarm member i to swarm member j
        directionMagnitude(j) = norm(direction(j,:));
        
        % Weighted distance vector from swarm member i to swarm member j
        weightedDirection(j,:) = (w_m1*exp(-c1*directionMagnitude(j)) - ...
            w_m2*exp(-c2* directionMagnitude(j)))*direction(j,:)/directionMagnitude(j);
        
        % Sum of weighted contributions from each target
        sum(1,:) = sum(1,:) + weightedDirection(j,:);
    end
end
% Direction for swarm member i to move towards
swarm.memberDir(i,:) = sum;
end