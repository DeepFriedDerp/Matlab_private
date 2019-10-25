function [aeroForces] = paramSpace_2_1_2_1_1_2_2(sailStates,airStates)

	CL = (4.423526)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.883452)*sailStates.p + (34.545322)*sailStates.q + (0.279929)*sailStates.r + (0.009833)*sailStates.de;
	CD = -0.674970;
	CY = (0.034972)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.437708)*sailStates.p + (-0.550479)*sailStates.q + (0.093057)*sailStates.r + (-0.000118)*sailStates.de;

	Cl = (1.610842)*sailStates.alpha + (-0.197046)*sailStates.beta + (-1.544346)*sailStates.p + (12.484230)*sailStates.q + (0.499983)*sailStates.r + (0.001055)*sailStates.de;
	Cm = (-15.113776)*sailStates.alpha + (0.000000)*sailStates.beta + (10.908201)*sailStates.p + (-149.810104)*sailStates.q + (-0.791201)*sailStates.r + (-0.069050)*sailStates.de;
	Cn = (0.121145)*sailStates.alpha + (-0.041883)*sailStates.beta + (-1.284402)*sailStates.p + (7.402662)*sailStates.q + (-0.096998)*sailStates.r + (0.000274)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end