function [aeroForces] = paramSpace_4_2_2_3_2_3_3(sailStates,airStates)

	CL = (4.165094)*sailStates.alpha + (0.121188)*sailStates.beta + (-2.781148)*sailStates.p + (39.723835)*sailStates.q + (1.744105)*sailStates.r + (0.011269)*sailStates.de;
	CD = -0.187220;
	CY = (0.035127)*sailStates.alpha + (-0.025177)*sailStates.beta + (0.548425)*sailStates.p + (-0.194782)*sailStates.q + (-0.109081)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.408160)*sailStates.alpha + (-0.227295)*sailStates.beta + (-1.400606)*sailStates.p + (12.700862)*sailStates.q + (1.364482)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-12.820354)*sailStates.alpha + (-0.436927)*sailStates.beta + (8.553744)*sailStates.p + (-141.871536)*sailStates.q + (-5.797599)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.273556)*sailStates.alpha + (0.052738)*sailStates.beta + (-1.007565)*sailStates.p + (3.778531)*sailStates.q + (-0.015615)*sailStates.r + (0.000153)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end