function [aeroForces] = paramSpace_2_1_1_2_1_1_2(sailStates,airStates)

	CL = (3.897991)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.729330)*sailStates.p + (39.174809)*sailStates.q + (-1.595194)*sailStates.r + (0.010963)*sailStates.de;
	CD = -0.049430;
	CY = (-0.074034)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.469707)*sailStates.p + (-0.230435)*sailStates.q + (-0.099815)*sailStates.r + (-0.000049)*sailStates.de;

	Cl = (1.255868)*sailStates.alpha + (0.243981)*sailStates.beta + (-1.346805)*sailStates.p + (12.086244)*sailStates.q + (-1.250345)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-12.307369)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.499091)*sailStates.p + (-140.986252)*sailStates.q + (5.350334)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (0.281732)*sailStates.alpha + (0.051860)*sailStates.beta + (0.815844)*sailStates.p + (-2.407971)*sailStates.q + (-0.031843)*sailStates.r + (0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end