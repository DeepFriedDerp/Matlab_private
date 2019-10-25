function [aeroForces] = paramSpace_1_1_4_2_3_2_2(sailStates,airStates)

	CL = (3.976104)*sailStates.alpha + (-0.200009)*sailStates.beta + (-2.440029)*sailStates.p + (35.065823)*sailStates.q + (-1.159805)*sailStates.r + (0.010600)*sailStates.de;
	CD = 0.024850;
	CY = (0.097525)*sailStates.alpha + (-0.026957)*sailStates.beta + (-0.318673)*sailStates.p + (0.756270)*sailStates.q + (-0.063307)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.343609)*sailStates.alpha + (0.051561)*sailStates.beta + (-1.188077)*sailStates.p + (10.461445)*sailStates.q + (-0.805441)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-13.826377)*sailStates.alpha + (0.626638)*sailStates.beta + (7.864706)*sailStates.p + (-132.741776)*sailStates.q + (3.841864)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.014627)*sailStates.alpha + (0.025121)*sailStates.beta + (0.517899)*sailStates.p + (-2.261613)*sailStates.q + (-0.010601)*sailStates.r + (-0.000270)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end