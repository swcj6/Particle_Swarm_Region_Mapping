function F = getPlots(swarm, target, obstacle, currentTime)

figure(1)
clf(1)
hold on

% Plot all active swarm members
plot3(swarm.memberPosition(swarm.memberActive == 1,1),...
    swarm.memberPosition(swarm.memberActive == 1,2),...
    swarm.memberPosition(swarm.memberActive == 1,3),...
    'o', 'MarkerSize', 6, 'MarkerFaceColor', [0,114,189]/255, 'MarkerEdgeColor', [0,114,189]/255);
numSwarmActive = nnz(swarm.memberActive);

% Plot all active targets
plot3(target.memberPosition(target.memberActive == 1,1),...
    target.memberPosition(target.memberActive == 1,2),...
    target.memberPosition(target.memberActive == 1,3),...
    's', 'MarkerSize', 12, 'MarkerFaceColor', [119,172,48]/255, 'MarkerEdgeColor', [119,172,48]/255);
numTargetActive = nnz(target.memberActive);

% Plot obstacles
plot3(obstacle.memberPosition(:,1),...
    obstacle.memberPosition(:,2),...
    obstacle.memberPosition(:,3),...
    '^', 'MarkerSize', 12, 'MarkerFaceColor', [237,177,32]/255, 'MarkerEdgeColor', [237,177,32]/255);

% Edit axis properties
ax = gca;
ax.LineWidth = 1;
ax.FontSize = 18;
ax.FontWeight = 'bold';
ax.Color = [245,245,245]/255;

% Label figure
xlabel('X (m)')
ylabel('Y (m)')
zlabel('Z (m)')
title(['Time = ', num2str(currentTime), 's'])
view(-70, 40)
shift = 100;
axis([-shift target.initDomain(1) -shift target.initDomain(2) -shift/2 shift/2]);
grid on
set(gcf,'color','w');
legend(['Active swarm members: ', num2str(numSwarmActive)],...
    ['Active targets: ', num2str(numTargetActive)], ['Obstacles: ', num2str(obstacle.numMembers)], 'Location', 'northwest')

F = getframe(gcf);

end