function [aeroForces] = paramSpace_1_1_1_1_2_2_2(sailStates,airStates)

	CL = (3.278100)*sailStates.alpha + (0.558259)*sailStates.beta + (-6.071638)*sailStates.p + (57.047325)*sailStates.q + (1.899781)*sailStates.r + (0.011174)*sailStates.de;
	CD = -5.481740;
	CY = (2.169761)*sailStates.alpha + (-0.031540)*sailStates.beta + (1.157409)*sailStates.p + (2.887332)*sailStates.q + (0.152171)*sailStates.r + (0.000656)*sailStates.de;

	Cl = (-1.015513)*sailStates.alpha + (-0.599388)*sailStates.beta + (-4.244163)*sailStates.p + (37.059212)*sailStates.q + (2.057256)*sailStates.r + (0.005722)*sailStates.de;
	Cm = (6.031093)*sailStates.alpha + (-2.233687)*sailStates.beta + (22.372032)*sailStates.p + (-238.797119)*sailStates.q + (-6.332510)*sailStates.r + (-0.082361)*sailStates.de;
	Cn = (-8.438367)*sailStates.alpha + (-0.103791)*sailStates.beta + (-3.257190)*sailStates.p + (15.130742)*sailStates.q + (-0.084139)*sailStates.r + (-0.000351)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end