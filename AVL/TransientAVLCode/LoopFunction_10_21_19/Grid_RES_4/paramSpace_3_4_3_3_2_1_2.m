function [aeroForces] = paramSpace_3_4_3_3_2_1_2(sailStates,airStates)

	CL = (4.143021)*sailStates.alpha + (0.072325)*sailStates.beta + (-2.529979)*sailStates.p + (33.930210)*sailStates.q + (-0.317195)*sailStates.r + (0.010702)*sailStates.de;
	CD = -0.141470;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.225864)*sailStates.p + (-0.000000)*sailStates.q + (0.014804)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.197684)*sailStates.alpha + (0.133531)*sailStates.beta + (-1.144551)*sailStates.p + (8.902048)*sailStates.q + (-0.374882)*sailStates.r + (0.000209)*sailStates.de;
	Cm = (-14.731553)*sailStates.alpha + (-0.277985)*sailStates.beta + (8.833305)*sailStates.p + (-136.150452)*sailStates.q + (1.064865)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.171226)*sailStates.alpha + (-0.005981)*sailStates.beta + (0.577137)*sailStates.p + (-2.869693)*sailStates.q + (-0.008360)*sailStates.r + (-0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end