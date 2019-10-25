function [aeroForces] = paramSpace_4_1_1_3_2_2_2(sailStates,airStates)

	CL = (3.867680)*sailStates.alpha + (0.173070)*sailStates.beta + (-2.462359)*sailStates.p + (34.941216)*sailStates.q + (0.966120)*sailStates.r + (0.010604)*sailStates.de;
	CD = 0.056800;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.198465)*sailStates.p + (-0.000000)*sailStates.q + (-0.039477)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.255527)*sailStates.alpha + (-0.034400)*sailStates.beta + (-1.201967)*sailStates.p + (10.422042)*sailStates.q + (0.646493)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-13.780661)*sailStates.alpha + (-0.537761)*sailStates.beta + (8.123792)*sailStates.p + (-133.820877)*sailStates.q + (-3.216077)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.141031)*sailStates.alpha + (0.016200)*sailStates.beta + (-0.264317)*sailStates.p + (0.540888)*sailStates.q + (-0.028754)*sailStates.r + (0.000039)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end