function [thresholds, t1, t2, t3, t4] = computeClippingPoints(R, Vs, f0, A)
    % Computes the clipping points and thresholds
    thresholds = (R(:,1) ./ R(:,2)) * Vs;
    t1 = asin((Vs * R(:,1)) ./ (A * R(:,2))) / (2 * pi * f0);
    t2 = (1 / (2 * f0)) - t1;
    t3 = (1 / (2 * f0)) + t1;
    t4 = (1 / f0) - t1;
end
