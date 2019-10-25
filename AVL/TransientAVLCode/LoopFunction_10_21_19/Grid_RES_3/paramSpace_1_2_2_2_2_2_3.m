function [aeroForces] = paramSpace_1_2_2_2_2_2_3(sailStates,airStates)

	CL = (3.844500)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.893590)*sailStates.p + (38.534698)*sailStates.q + (-1.019686)*sailStates.r + (0.010948)*sailStates.de;
	CD = 0.066050;
	CY = (-0.007110)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.241071)*sailStates.p + (0.267957)*sailStates.q + (-0.042507)*sailStates.r + (0.000057)*sailStates.de;

	Cl = (1.335771)*sailStates.alpha + (0.109847)*sailStates.beta + (-1.495164)*sailStates.p + (12.947622)*sailStates.q + (-0.718281)*sailStates.r + (0.000857)*sailStates.de;
	Cm = (-13.682323)*sailStates.alpha + (0.000000)*sailStates.beta + (9.588962)*sailStates.p + (-146.430145)*sailStates.q + (3.427929)*sailStates.r + (-0.069510)*sailStates.de;
	Cn = (0.252180)*sailStates.alpha + (0.019369)*sailStates.beta + (0.306146)*sailStates.p + (-0.679576)*sailStates.q + (-0.026184)*sailStates.r + (-0.000108)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end