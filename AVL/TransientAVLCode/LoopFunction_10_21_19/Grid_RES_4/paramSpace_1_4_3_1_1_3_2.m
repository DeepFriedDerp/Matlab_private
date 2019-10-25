function [aeroForces] = paramSpace_1_4_3_1_1_3_2(sailStates,airStates)

	CL = (6.639015)*sailStates.alpha + (-0.387693)*sailStates.beta + (-2.340747)*sailStates.p + (26.783140)*sailStates.q + (1.703458)*sailStates.r + (0.008965)*sailStates.de;
	CD = -2.587100;
	CY = (-0.163131)*sailStates.alpha + (-0.029911)*sailStates.beta + (1.083729)*sailStates.p + (-1.664521)*sailStates.q + (0.215508)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (2.322851)*sailStates.alpha + (-0.585118)*sailStates.beta + (-1.084011)*sailStates.p + (7.055400)*sailStates.q + (1.787153)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-18.210699)*sailStates.alpha + (1.523845)*sailStates.beta + (10.156760)*sailStates.p + (-136.195908)*sailStates.q + (-5.514894)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.923576)*sailStates.alpha + (-0.074012)*sailStates.beta + (-2.601527)*sailStates.p + (13.527458)*sailStates.q + (-0.119078)*sailStates.r + (0.000678)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end