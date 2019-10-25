function [aeroForces] = paramSpace_3_3_1_2_2_3_3(sailStates,airStates)

	CL = (4.511682)*sailStates.alpha + (-0.093298)*sailStates.beta + (-2.995625)*sailStates.p + (39.410255)*sailStates.q + (1.381281)*sailStates.r + (0.011533)*sailStates.de;
	CD = -0.457730;
	CY = (0.078235)*sailStates.alpha + (-0.024951)*sailStates.beta + (0.546156)*sailStates.p + (-0.100923)*sailStates.q + (-0.035786)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.505736)*sailStates.alpha + (-0.298958)*sailStates.beta + (-1.528803)*sailStates.p + (12.951248)*sailStates.q + (1.178436)*sailStates.r + (0.000834)*sailStates.de;
	Cm = (-14.088481)*sailStates.alpha + (0.331760)*sailStates.beta + (9.880479)*sailStates.p + (-148.239990)*sailStates.q + (-4.645821)*sailStates.r + (-0.071230)*sailStates.de;
	Cn = (-0.231435)*sailStates.alpha + (0.017274)*sailStates.beta + (-1.152106)*sailStates.p + (5.119809)*sailStates.q + (0.004583)*sailStates.r + (0.000158)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end