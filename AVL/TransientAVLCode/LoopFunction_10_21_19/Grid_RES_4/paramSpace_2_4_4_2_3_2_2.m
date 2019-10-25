function [aeroForces] = paramSpace_2_4_4_2_3_2_2(sailStates,airStates)

	CL = (4.063191)*sailStates.alpha + (0.064689)*sailStates.beta + (-2.539748)*sailStates.p + (34.720669)*sailStates.q + (-0.518932)*sailStates.r + (0.010917)*sailStates.de;
	CD = 0.013470;
	CY = (0.096215)*sailStates.alpha + (-0.024209)*sailStates.beta + (-0.177157)*sailStates.p + (0.769435)*sailStates.q + (-0.011530)*sailStates.r + (0.000165)*sailStates.de;

	Cl = (1.204312)*sailStates.alpha + (0.090032)*sailStates.beta + (-1.145354)*sailStates.p + (9.120150)*sailStates.q + (-0.352315)*sailStates.r + (0.000192)*sailStates.de;
	Cm = (-14.619554)*sailStates.alpha + (-0.141500)*sailStates.beta + (8.606576)*sailStates.p + (-135.788696)*sailStates.q + (1.717572)*sailStates.r + (-0.068965)*sailStates.de;
	Cn = (-0.102467)*sailStates.alpha + (0.003324)*sailStates.beta + (0.326779)*sailStates.p + (-1.980525)*sailStates.q + (0.002848)*sailStates.r + (-0.000262)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end