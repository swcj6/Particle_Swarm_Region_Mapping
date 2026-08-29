function swarm = updateSwarmPosition_S(i, swarm, timeStep)

% Velocity of swarm member i at previous step
velocityOld = swarm.memberVelocity(i,:);

% Update velocity and speed of swarm member i
swarm.memberVelocity(i,:) = velocityOld + swarm.memberAcceleration(i,:) * timeStep;
memberSpeed = norm(swarm.memberVelocity(i,:));

% Check if max swarm member i speed is exceeded and rescale velocity if necessary
% COMPLETE THIS PART!
if memberSpeed > swarm.maxSpeed
        swarm.memberVelocity(i,:) = (swarm.memberVelocity(i,:) / memberSpeed) * swarm.maxSpeed;
end
    
% Update swarm member i position
swarm.memberPosition(i,:) = swarm.memberPosition(i,:) + swarm.memberVelocity(i,:) * timeStep;
end

