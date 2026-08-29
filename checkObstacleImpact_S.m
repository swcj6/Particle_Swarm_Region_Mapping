function swarm = checkObstacleImpact_S(i, swarm, obstacle)

direction = zeros(obstacle.numMembers, 3);
directionMagnitude = zeros(obstacle.numMembers);

for j = 1:obstacle.numMembers
    
    % COMPLETE THIS PART!
    direction = obstacle.memberPosition(j,:) - swarm.memberPosition(i,:);
        directionMagnitude = norm(direction);

    if directionMagnitude <= swarm.obstacleImpactTol
            % deactivate impacted member
            swarm.memberActive(i) = 0;
    end
    
end

end
