function [aeroForces] = paramSpace_1_4_2_2_2_2_3(sailStates,airStates)

	CL = (3.714147)*sailStates.alpha + (0.236017)*sailStates.beta + (-2.848303)*sailStates.p + (38.340508)*sailStates.q + (-1.139303)*sailStates.r + (0.010626)*sailStates.de;
	CD = 0.082580;
	CY = (-0.009205)*sailStates.alpha + (-0.023797)*sailStates.beta + (-0.275061)*sailStates.p + (0.301044)*sailStates.q + (-0.054724)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.238190)*sailStates.alpha + (0.201096)*sailStates.beta + (-1.424881)*sailStates.p + (12.301358)*sailStates.q + (-0.802235)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-13.118542)*sailStates.alpha + (-0.873578)*sailStates.beta + (9.355288)*sailStates.p + (-144.677322)*sailStates.q + (3.833278)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (0.253536)*sailStates.alpha + (0.028094)*sailStates.beta + (0.362956)*sailStates.p + (-0.878189)*sailStates.q + (-0.031013)*sailStates.r + (-0.000113)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end