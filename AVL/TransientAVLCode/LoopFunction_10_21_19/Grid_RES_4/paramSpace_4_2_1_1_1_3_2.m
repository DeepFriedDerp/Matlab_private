function [aeroForces] = paramSpace_4_2_1_1_1_3_2(sailStates,airStates)

	CL = (7.838184)*sailStates.alpha + (0.252420)*sailStates.beta + (-2.602149)*sailStates.p + (43.415565)*sailStates.q + (3.651551)*sailStates.r + (0.012327)*sailStates.de;
	CD = -3.027210;
	CY = (-0.259042)*sailStates.alpha + (-0.026573)*sailStates.beta + (1.496581)*sailStates.p + (-1.664525)*sailStates.q + (-0.297510)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (3.041699)*sailStates.alpha + (-0.602010)*sailStates.beta + (-1.202592)*sailStates.p + (12.282922)*sailStates.q + (3.083544)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-12.543118)*sailStates.alpha + (-0.914107)*sailStates.beta + (6.143308)*sailStates.p + (-132.472137)*sailStates.q + (-12.021070)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.399561)*sailStates.alpha + (0.139990)*sailStates.beta + (-3.178933)*sailStates.p + (14.940312)*sailStates.q + (0.066094)*sailStates.r + (0.000743)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end