function [aeroForces] = paramSpace_4_4_4_2_3_1_2(sailStates,airStates)

	CL = (4.162391)*sailStates.alpha + (0.030109)*sailStates.beta + (-2.405372)*sailStates.p + (31.359102)*sailStates.q + (-0.225016)*sailStates.r + (0.009640)*sailStates.de;
	CD = -0.371140;
	CY = (0.085805)*sailStates.alpha + (-0.027429)*sailStates.beta + (-0.347306)*sailStates.p + (0.756269)*sailStates.q + (0.069165)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.276222)*sailStates.alpha + (0.159548)*sailStates.beta + (-1.096007)*sailStates.p + (8.250288)*sailStates.q + (-0.409699)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-14.879846)*sailStates.alpha + (-0.063198)*sailStates.beta + (9.022448)*sailStates.p + (-134.899979)*sailStates.q + (0.625055)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.438948)*sailStates.alpha + (-0.017119)*sailStates.beta + (0.971910)*sailStates.p + (-5.691717)*sailStates.q + (-0.068812)*sailStates.r + (-0.000310)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end