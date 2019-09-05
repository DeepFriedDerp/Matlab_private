derp = '$GPRMC,142437.200,A,3546.0763,N,07839.7664,W,0.00,227.45,210119,,,D*70';

lerp = extractBefore(derp,"A")

if size(strfind(lerp,","),2) > 1
    derp = 
end