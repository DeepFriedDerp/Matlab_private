function [aeroForces] = paramSpace_4_1_4_2_2_1_2(sailStates,airStates)

	CL = (4.286365)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.762658)*sailStates.p + (38.249146)*sailStates.q + (-1.398903)*sailStates.r + (0.011354)*sailStates.de;
	CD = -0.161080;
	CY = (0.025670)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.472885)*sailStates.p + (0.520428)*sailStates.q + (-0.066404)*sailStates.r + (0.000112)*sailStates.de;

	Cl = (1.455741)*sailStates.alpha + (0.215564)*sailStates.beta + (-1.365763)*sailStates.p + (11.849184)*sailStates.q + (-1.087690)*sailStates.r + (0.000599)*sailStates.de;
	Cm = (-14.004864)*sailStates.alpha + (0.000000)*sailStates.beta + (8.854006)*sailStates.p + (-141.704483)*sailStates.q + (4.662261)*sailStates.r + (-0.069692)*sailStates.de;
	Cn = (0.094106)*sailStates.alpha + (0.030296)*sailStates.beta + (0.903016)*sailStates.p + (-3.989848)*sailStates.q + (0.000672)*sailStates.r + (-0.000248)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end