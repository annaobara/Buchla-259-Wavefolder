function Vout = wavefolder(Vin, R, thresholds, t1, t2, t3, t4, f0, fs, Vs)
    % Applies wavefolding using polyBLAMP and inverse clipping

    T = 1 / fs;
    mu = abs(2 * pi * f0 * max(Vin) * cos(2 * pi * f0 * t1) / fs);
    nk = floor([t1, t2, t3, t4] / T);
    dk = ([t1, t2, t3, t4] / T) - nk;
    R_pre  = (dk.^3) / 6;
    R_post = (-dk.^3) / 6 + (dk.^2) / 2 - (dk) / 2 + 1/6;

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

    for k = 1:5
        for n = 1:4
            clip_s = nk(k,n)+1;
            if Vin(clip_s) < Vin(clip_s+1)
                if Vin(clip_s+1) > 0
                    Vclip(k, clip_s+1) = Vclip(k, clip_s+1) + R_post(k) * mu(k);
                    Vclip(k, clip_s)   = Vclip(k, clip_s)   + R_pre(k) * mu(k);
                else
                    Vclip(k, clip_s+1) = Vclip(k, clip_s+1) + R_pre(k) * mu(k);
                    Vclip(k, clip_s)   = Vclip(k, clip_s)   + R_post(k) * mu(k);
                end
            else
                if Vin(clip_s) > 0
                    Vclip(k, clip_s+1) = Vclip(k, clip_s+1) - R_pre(k) * mu(k);
                    Vclip(k, clip_s)   = Vclip(k, clip_s)   - R_post(k) * mu(k);
                else
                    Vclip(k, clip_s+1) = Vclip(k, clip_s+1) - R_post(k) * mu(k);
                    Vclip(k, clip_s)   = Vclip(k, clip_s)   - R_pre(k) * mu(k);
                end
            end
        end
    end

    Vout = zeros(5, length(Vclip));
    for k = 1:5
        for n = 1:length(Vclip)
            denom = (R(k,1) * R(k,3)) + (R(k,2) * R(k,3)) + (R(k,1) * R(k,2));
            factor = (R(k,2) * R(k,3)) / denom;
            Vout(k, n) = factor * (Vclip(k, n) - sign(Vclip(k, n)) * (Vs * R(k,1) / R(k,2)));
        end
    end

    Vout = -12.000 * Vout(1, :) - 27.777 * Vout(2, :) - 21.428 * Vout(3, :) + ...
            17.647 * Vout(4, :) + 36.363 * Vout(5, :) + 5.000 * Vin;
end

