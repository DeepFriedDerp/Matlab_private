function [aeroForces] = paramSpace_1_4_4_1_2_2_2(sailStates,airStates)

	CL = (3.867680)*sailStates.alpha + (0.173070)*sailStates.beta + (-2.462359)*sailStates.p + (34.941216)*sailStates.q + (-0.966120)*sailStates.r + (0.010604)*sailStates.de;
	CD = 0.056800;
	CY = (0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.198465)*sailStates.p + (0.000000)*sailStates.q + (-0.039477)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.115759)*sailStates.alpha + (0.158956)*sailStates.beta + (-1.107561)*sailStates.p + (9.234161)*sailStates.q + (-0.627843)*sailStates.r + (0.000200)*sailStates.de;
	Cm = (-13.780663)*sailStates.alpha + (-0.537761)*sailStates.beta + (8.123793)*sailStates.p + (-133.820877)*sailStates.q + (3.216077)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (0.086300)*sailStates.alpha + (0.022261)*sailStates.beta + (0.283096)*sailStates.p + (-0.777172)*sailStates.q + (-0.025044)*sailStates.r + (-0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end