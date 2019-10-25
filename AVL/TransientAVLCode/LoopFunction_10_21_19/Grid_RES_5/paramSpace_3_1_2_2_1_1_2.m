function [aeroForces] = paramSpace_3_1_2_2_1_1_2(sailStates,airStates)

	CL = (4.009073)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.757736)*sailStates.p + (38.662987)*sailStates.q + (-1.397651)*sailStates.r + (0.011157)*sailStates.de;
	CD = -0.073530;
	CY = (-0.072022)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.414336)*sailStates.p + (-0.261303)*sailStates.q + (-0.073049)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.282544)*sailStates.alpha + (0.217590)*sailStates.beta + (-1.363308)*sailStates.p + (11.948942)*sailStates.q + (-1.095866)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-13.056031)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.795468)*sailStates.p + (-141.841248)*sailStates.q + (4.694854)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (0.240410)*sailStates.alpha + (0.038367)*sailStates.beta + (0.734826)*sailStates.p + (-2.290456)*sailStates.q + (-0.021324)*sailStates.r + (0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end