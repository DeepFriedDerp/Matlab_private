function [aeroForces] = paramSpace_3_1_4_1_2_2_1(sailStates,airStates)

	CL = (3.665109)*sailStates.alpha + (0.084622)*sailStates.beta + (-1.662189)*sailStates.p + (27.559364)*sailStates.q + (0.225775)*sailStates.r + (0.010440)*sailStates.de;
	CD = 0.041810;
	CY = (0.005071)*sailStates.alpha + (-0.024479)*sailStates.beta + (0.061078)*sailStates.p + (0.221995)*sailStates.q + (-0.003980)*sailStates.r + (0.000047)*sailStates.de;

	Cl = (0.677206)*sailStates.alpha + (-0.028595)*sailStates.beta + (-0.524843)*sailStates.p + (3.611141)*sailStates.q + (0.169874)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-13.410399)*sailStates.alpha + (-0.397516)*sailStates.beta + (5.732494)*sailStates.p + (-111.854546)*sailStates.q + (-0.795137)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (0.052368)*sailStates.alpha + (0.002255)*sailStates.beta + (-0.103983)*sailStates.p + (0.149239)*sailStates.q + (-0.002359)*sailStates.r + (-0.000067)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end