function [aeroForces] = paramSpace_1_4_1_1_2_3_1(sailStates,airStates)

	CL = (5.294360)*sailStates.alpha + (-0.336865)*sailStates.beta + (-1.438458)*sailStates.p + (19.888098)*sailStates.q + (1.605872)*sailStates.r + (0.008427)*sailStates.de;
	CD = -2.005160;
	CY = (-0.407938)*sailStates.alpha + (-0.027100)*sailStates.beta + (0.896051)*sailStates.p + (-0.662189)*sailStates.q + (0.178307)*sailStates.r + (-0.000137)*sailStates.de;

	Cl = (0.897201)*sailStates.alpha + (-0.536856)*sailStates.beta + (-0.353343)*sailStates.p + (0.409572)*sailStates.q + (1.672697)*sailStates.r + (-0.000898)*sailStates.de;
	Cm = (-15.859266)*sailStates.alpha + (1.227073)*sailStates.beta + (6.817767)*sailStates.p + (-109.940704)*sailStates.q + (-5.194036)*sailStates.r + (-0.064501)*sailStates.de;
	Cn = (1.999908)*sailStates.alpha + (-0.071372)*sailStates.beta + (-2.081137)*sailStates.p + (9.891138)*sailStates.q + (-0.067527)*sailStates.r + (0.000343)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end