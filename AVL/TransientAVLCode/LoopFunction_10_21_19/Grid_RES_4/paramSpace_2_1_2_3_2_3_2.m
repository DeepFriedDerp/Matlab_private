function [aeroForces] = paramSpace_2_1_2_3_2_3_2(sailStates,airStates)

	CL = (4.143021)*sailStates.alpha + (0.072325)*sailStates.beta + (-2.529979)*sailStates.p + (33.930210)*sailStates.q + (0.317195)*sailStates.r + (0.010702)*sailStates.de;
	CD = -0.141470;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.225864)*sailStates.p + (0.000000)*sailStates.q + (0.014804)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.348984)*sailStates.alpha + (-0.091818)*sailStates.beta + (-1.242245)*sailStates.p + (10.110606)*sailStates.q + (0.368436)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.731553)*sailStates.alpha + (-0.277986)*sailStates.beta + (8.833305)*sailStates.p + (-136.150452)*sailStates.q + (-1.064865)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (0.151535)*sailStates.alpha + (-0.008789)*sailStates.beta + (-0.583540)*sailStates.p + (2.948906)*sailStates.q + (-0.008782)*sailStates.r + (0.000055)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end