function [aeroForces] = paramSpace_1_4_4_2_3_2_2(sailStates,airStates)

	CL = (3.976104)*sailStates.alpha + (0.200009)*sailStates.beta + (-2.440029)*sailStates.p + (35.065823)*sailStates.q + (-1.159805)*sailStates.r + (0.010600)*sailStates.de;
	CD = 0.024850;
	CY = (0.097525)*sailStates.alpha + (-0.022615)*sailStates.beta + (-0.318673)*sailStates.p + (0.756270)*sailStates.q + (-0.063307)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.203852)*sailStates.alpha + (0.201385)*sailStates.beta + (-1.093671)*sailStates.p + (9.273565)*sailStates.q + (-0.786790)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-13.826377)*sailStates.alpha + (-0.626638)*sailStates.beta + (7.864705)*sailStates.p + (-132.741791)*sailStates.q + (3.841863)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.048258)*sailStates.alpha + (0.025193)*sailStates.beta + (0.536677)*sailStates.p + (-2.497897)*sailStates.q + (-0.006891)*sailStates.r + (-0.000270)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end