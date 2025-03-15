function Vout = applyWavefolding(Vin, thresholds, R, f0, fs)
    % Applies wavefolding with anti-aliasing
    Vclip = zeros(5, length(Vin));
    
    for k = 1:5
        for n = 1:length(Vin)
            if abs(Vin(n)) > thresholds(k)
                Vclip(k, n) = Vin(n); 
            else
                Vclip(k, n) = sign(Vin(n)) * thresholds(k); 
            end
        end
    end 

    % Compute polyBLAMP correction
    mu = abs(2 * pi * f0 * max(Vin) * cos(2 * pi * f0 * thresholds(1)) / fs);
    R_pre  = (mu.^3) / 6;  
    R_post = (-mu.^3) / 6 + (mu.^2) / 2 - (mu) / 2 + 1/6;

    for k = 1:5
        for n = 1:length(Vclip)
            denom = (R(k,1) * R(k,3)) + (R(k,2) * R(k,3)) + (R(k,1) * R(k,2));
            factor = (R(k,2) * R(k,3)) / denom;
            Vclip(k, n) = factor * (Vclip(k, n) - sign(Vclip(k, n)) * (Vs * R(k,1) / R(k,2)));
        end
    end

    % Sum the final output
    Vout = -12.000 * Vclip(1, :) - 27.777 * Vclip(2, :) - 21.428 * Vclip(3, :) + ...
            17.647 * Vclip(4, :) + 36.363 * Vclip(5, :) + 5.000 * Vin;
end
