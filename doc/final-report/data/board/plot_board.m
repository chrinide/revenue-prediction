#!/usr/bin/env octave -qf

figure('visible','off');

s = load('private_board.txt');
s = sort(s) / 1e6;
s = s(s<2.2);

our_score = 1783082.67907 / 1e6;
our_rank = sum(s < our_score);

% mean_score = 1929245.11374 / 1e6;
% mean_rank = sum(s < mean_score);

plot(s, 'LineWidth', 8);
hold on;
plot(our_rank, our_score, 'rd', 'MarkerSize', 12, 'MarkerFaceColor', 'auto');
% hold on;
% plot(mean_rank, mean_score, 'go', 'MarkerSize', 12, 'MarkerFaceColor', 'auto');

h = legend('All Players', 'Ours');

set(h, 'FontSize', 20, 'FontName', 'Helvetica', 'Location', 'Southeast');

grid on;

% title('Public Board', 'FontSize', 20, 'FontWeight', 'bold', 'FontName', 'Helvetica');
xlabel('Rank', 'FontSize', 20, 'FontName', 'Helvetica');
ylabel('RMSE / 10^6', 'FontSize', 20, 'FontName', 'Helvetica');

ylim([1.7 2.2])

set(gca, 'FontSize', 20, 'FontName', 'Helvetica');

filename = '../../figs/pb.eps'
fprintf(stdout, 'saving to %s\n', filename);

print('-depsc', filename, '-S800,400');