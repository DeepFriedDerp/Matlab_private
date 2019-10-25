function [aeroForces] = paramSpace_1_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.466180)*sailStates.alpha + (-0.397836)*sailStates.beta + (-2.553934)*sailStates.p + (38.268055)*sailStates.q + (-1.905598)*sailStates.r + (0.011135)*sailStates.de;
	CD = -0.487510;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.686915)*sailStates.p + (-0.000001)*sailStates.q + (-0.121122)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.443890)*sailStates.alpha + (0.229494)*sailStates.beta + (-1.230461)*sailStates.p + (11.200852)*sailStates.q + (-1.586637)*sailStates.r + (0.000445)*sailStates.de;
	Cm = (-12.302468)*sailStates.alpha + (1.553482)*sailStates.beta + (7.653361)*sailStates.p + (-134.612778)*sailStates.q + (6.385846)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.007979)*sailStates.alpha + (0.061343)*sailStates.beta + (1.360946)*sailStates.p + (-5.327445)*sailStates.q + (-0.001791)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end