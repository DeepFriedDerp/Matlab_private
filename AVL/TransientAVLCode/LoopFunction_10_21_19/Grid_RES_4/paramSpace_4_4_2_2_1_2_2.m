function [aeroForces] = paramSpace_4_4_2_2_1_2_2(sailStates,airStates)

	CL = (3.944135)*sailStates.alpha + (-0.220884)*sailStates.beta + (-2.439309)*sailStates.p + (35.114052)*sailStates.q + (1.168297)*sailStates.r + (0.010513)*sailStates.de;
	CD = 0.029710;
	CY = (-0.097529)*sailStates.alpha + (-0.022458)*sailStates.beta + (0.333006)*sailStates.p + (-0.756269)*sailStates.q + (-0.066212)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.207125)*sailStates.alpha + (-0.209022)*sailStates.beta + (-1.093322)*sailStates.p + (9.275776)*sailStates.q + (0.810093)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-13.631642)*sailStates.alpha + (0.758172)*sailStates.beta + (7.855131)*sailStates.p + (-132.741791)*sailStates.q + (-3.889994)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.047646)*sailStates.alpha + (0.026373)*sailStates.beta + (-0.558232)*sailStates.p + (2.509010)*sailStates.q + (-0.006915)*sailStates.r + (0.000260)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end