function [aeroForces] = paramSpace_1_1_3_2_2_3_2(sailStates,airStates)

	CL = (4.235429)*sailStates.alpha + (0.072893)*sailStates.beta + (-2.417634)*sailStates.p + (31.740070)*sailStates.q + (0.156246)*sailStates.r + (0.010075)*sailStates.de;
	CD = -0.353540;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (0.292965)*sailStates.p + (-0.000000)*sailStates.q + (0.051658)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.331998)*sailStates.alpha + (-0.137084)*sailStates.beta + (-1.187661)*sailStates.p + (9.502472)*sailStates.q + (0.371005)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-15.223005)*sailStates.alpha + (-0.382487)*sailStates.beta + (8.866897)*sailStates.p + (-134.612778)*sailStates.q + (-0.496455)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.290545)*sailStates.alpha + (-0.031567)*sailStates.beta + (-0.831876)*sailStates.p + (4.304554)*sailStates.q + (-0.044608)*sailStates.r + (0.000054)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end