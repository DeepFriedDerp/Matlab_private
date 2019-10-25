function [aeroForces] = paramSpace_1_3_1_2_2_1_2(sailStates,airStates)

	CL = (4.466180)*sailStates.alpha + (0.397835)*sailStates.beta + (-2.553934)*sailStates.p + (38.268055)*sailStates.q + (-1.905599)*sailStates.r + (0.011135)*sailStates.de;
	CD = -0.487510;
	CY = (0.000000)*sailStates.alpha + (-0.024831)*sailStates.beta + (-0.686915)*sailStates.p + (-0.000001)*sailStates.q + (-0.121122)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.328660)*sailStates.alpha + (0.449841)*sailStates.beta + (-1.145843)*sailStates.p + (10.139987)*sailStates.q + (-1.571616)*sailStates.r + (0.000217)*sailStates.de;
	Cm = (-12.302468)*sailStates.alpha + (-1.553482)*sailStates.beta + (7.653362)*sailStates.p + (-134.612778)*sailStates.q + (6.385846)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.094565)*sailStates.alpha + (0.058442)*sailStates.beta + (1.375866)*sailStates.p + (-5.514504)*sailStates.q + (0.000857)*sailStates.r + (-0.000099)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end