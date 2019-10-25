function [aeroForces] = paramSpace_1_1_1_1_1_3_3(sailStates,airStates)

	CL = (6.049913)*sailStates.alpha + (0.300614)*sailStates.beta + (-3.191265)*sailStates.p + (34.145504)*sailStates.q + (1.342039)*sailStates.r + (0.009219)*sailStates.de;
	CD = -2.401810;
	CY = (0.260500)*sailStates.alpha + (-0.021284)*sailStates.beta + (0.949373)*sailStates.p + (-1.002334)*sailStates.q + (0.188950)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (2.482652)*sailStates.alpha + (-0.356897)*sailStates.beta + (-1.877109)*sailStates.p + (14.984664)*sailStates.q + (1.439773)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-15.706563)*sailStates.alpha + (-1.098210)*sailStates.beta + (12.886750)*sailStates.p + (-160.076126)*sailStates.q + (-4.263531)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.700860)*sailStates.alpha + (-0.109228)*sailStates.beta + (-2.495924)*sailStates.p + (13.568414)*sailStates.q + (-0.136156)*sailStates.r + (0.000540)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end