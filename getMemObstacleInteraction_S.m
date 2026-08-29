function swarm = getMemObstacleInteraction_S(i, swarm, obstacle, designParams)

w_o1 = designParams(6);
w_o2 = designParams(7);
b1 = designParams(12);
b2 = designParams(13);

direction = zeros(obstacle.numMembers, 3);
weightedDirection = zeros(obstacle.numMembers, 3);
directionMagnitude = zeros(obstacle.numMembers, 1);

sum = zeros(1,3);

for j = 1:obstacle.numMembers

       % COMPLETE THIS PART!
     if obstacle.memberActive(j)
       direction(j,:) = obstacle.memberPosition(j,:) - swarm.memberPosition(i,:);
        
        % Scalar distance from obstacle member i to swarm member j
        directionMagnitude(j) = norm(direction(j,:));
        
        % Weighted distance vector from obstacle member i to swarm member j
        weightedDirection(j,:) = (w_o1*exp(-b1*directionMagnitude(j)) - ...
            w_o2*exp(-b2* directionMagnitude(j)))*direction(j,:)/directionMagnitude(j);
        
        % Sum of weighted contributions from each target
        sum(1,:) = sum(1,:) + weightedDirection(j,:);
    end
end

% Driection for swarm member i to move towards
swarm.obstacleDir(i,:) = sum;


end
