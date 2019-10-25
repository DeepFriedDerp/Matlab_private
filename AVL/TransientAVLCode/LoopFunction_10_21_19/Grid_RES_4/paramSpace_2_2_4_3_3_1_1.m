function [aeroForces] = paramSpace_2_2_4_3_3_1_1(sailStates,airStates)

	CL = (4.384901)*sailStates.alpha + (-0.067729)*sailStates.beta + (-2.318773)*sailStates.p + (33.644222)*sailStates.q + (-1.069433)*sailStates.r + (0.011119)*sailStates.de;
	CD = -0.230770;
	CY = (0.101954)*sailStates.alpha + (-0.025085)*sailStates.beta + (-0.431574)*sailStates.p + (0.432842)*sailStates.q + (-0.028241)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.301368)*sailStates.alpha + (0.175028)*sailStates.beta + (-1.014216)*sailStates.p + (8.229575)*sailStates.q + (-0.883039)*sailStates.r + (0.000035)*sailStates.de;
	Cm = (-14.548750)*sailStates.alpha + (0.230712)*sailStates.beta + (7.690445)*sailStates.p + (-129.813766)*sailStates.q + (3.590190)*sailStates.r + (-0.069334)*sailStates.de;
	Cn = (-0.340045)*sailStates.alpha + (0.013347)*sailStates.beta + (0.917715)*sailStates.p + (-4.448171)*sailStates.q + (0.006313)*sailStates.r + (-0.000211)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end