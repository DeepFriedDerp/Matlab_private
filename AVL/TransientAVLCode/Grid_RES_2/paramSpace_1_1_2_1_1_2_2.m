function [aeroForces] = paramSpace_1_1_2_1_1_2_2(sailStates,airStates)

	CL = (6.793102)*sailStates.alpha + (0.177194)*sailStates.beta + (-2.485656)*sailStates.p + (31.602055)*sailStates.q + (-0.817247)*sailStates.r + (0.009337)*sailStates.de;
	CD = -2.069310;
	CY = (1.667709)*sailStates.alpha + (-0.050615)*sailStates.beta + (-0.719075)*sailStates.p + (13.456891)*sailStates.q + (-0.093715)*sailStates.r + (0.002858)*sailStates.de;

	Cl = (1.144272)*sailStates.alpha + (-0.236091)*sailStates.beta + (-1.345408)*sailStates.p + (11.847948)*sailStates.q + (-0.185766)*sailStates.r + (0.000406)*sailStates.de;
	Cm = (-17.732635)*sailStates.alpha + (-1.033386)*sailStates.beta + (8.278988)*sailStates.p + (-134.073837)*sailStates.q + (2.554151)*sailStates.r + (-0.067998)*sailStates.de;
	Cn = (-1.609368)*sailStates.alpha + (-0.001153)*sailStates.beta + (1.056568)*sailStates.p + (-14.232301)*sailStates.q + (0.136321)*sailStates.r + (-0.003885)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end