function [aeroForces] = paramSpace_3_2_1_3_3_3_3(sailStates,airStates)

	CL = (4.171137)*sailStates.alpha + (0.058679)*sailStates.beta + (-2.849344)*sailStates.p + (37.805805)*sailStates.q + (0.876240)*sailStates.r + (0.011375)*sailStates.de;
	CD = -0.127040;
	CY = (0.086381)*sailStates.alpha + (-0.024868)*sailStates.beta + (0.291393)*sailStates.p + (0.432842)*sailStates.q + (-0.019145)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.364726)*sailStates.alpha + (-0.143829)*sailStates.beta + (-1.445651)*sailStates.p + (12.157563)*sailStates.q + (0.725536)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-14.276722)*sailStates.alpha + (-0.199458)*sailStates.beta + (9.542830)*sailStates.p + (-144.575424)*sailStates.q + (-2.942214)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.155308)*sailStates.alpha + (0.010696)*sailStates.beta + (-0.602057)*sailStates.p + (2.246095)*sailStates.q + (-0.002072)*sailStates.r + (-0.000048)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end