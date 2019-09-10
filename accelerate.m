function V = accelerate( v, Vmax )
%加速，v当前速度，Vmax限速
V = min(v+1, Vmax);
end

