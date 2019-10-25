function [aeroForces] = paramSpace_4_4_4_3_3_3_1(sailStates,airStates)

	CL = (3.938972)*sailStates.alpha + (-0.357040)*sailStates.beta + (-2.273998)*sailStates.p + (35.197380)*sailStates.q + (1.426118)*sailStates.r + (0.010684)*sailStates.de;
	CD = -0.116790;
	CY = (0.040625)*sailStates.alpha + (-0.027177)*sailStates.beta + (0.435747)*sailStates.p + (0.684400)*sailStates.q + (-0.086602)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (0.976364)*sailStates.alpha + (-0.330029)*sailStates.beta + (-0.925590)*sailStates.p + (7.848571)*sailStates.q + (1.125182)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-12.137469)*sailStates.alpha + (1.414401)*sailStates.beta + (7.021214)*sailStates.p + (-127.495163)*sailStates.q + (-4.792055)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.153014)*sailStates.alpha + (0.050101)*sailStates.beta + (-0.849612)*sailStates.p + (2.737190)*sailStates.q + (-0.018598)*sailStates.r + (-0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end