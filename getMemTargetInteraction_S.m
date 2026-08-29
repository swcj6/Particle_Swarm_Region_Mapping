function [swarm, target] = getMemTargetInteraction_S(i, swarm, target, designParams)

w_t1 = designParams(4);
w_t2 = designParams(5);
a1 = designParams(10);
a2 = designParams(11);

direction = zeros(target.numMembers, 3);
weightedDirection = zeros(target.numMembers, 3);
directionMagnitude = zeros(target.numMembers, 1);

sum = zeros(1,3);

for j = 1:target.numMembers
  if target.memberActive(j)
        direction(j,:) = target.memberPosition(j,:) - swarm.memberPosition(i,:);
        
        % Scalar distance from target member i to swarm member j
        directionMagnitude(j) = norm(direction(j,:));
        
        % Weighted distance vector from target member i to swarm member j
        weightedDirection(j,:) = (w_t1*exp(-a1*directionMagnitude(j)) - ...
            w_t2*exp(-a2* directionMagnitude(j)))*direction(j,:)/directionMagnitude(j);
        
        % Sum of weighted contributions from each target
        sum(1,:) = sum(1,:) + weightedDirection(j,:);

    if directionMagnitude(j) <= swarm.targetArrivalTol
            % deactivate impacted member
            target.memberActive(j) = 0;
    end
  end 
end

% Direction for swarm member i to move towards
swarm.targetDir(i,:) = sum;



end