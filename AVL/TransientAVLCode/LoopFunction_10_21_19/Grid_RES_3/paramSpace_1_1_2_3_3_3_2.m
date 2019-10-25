function [aeroForces] = paramSpace_1_1_2_3_3_3_2(sailStates,airStates)

	CL = (3.937616)*sailStates.alpha + (-0.041755)*sailStates.beta + (-2.428212)*sailStates.p + (33.002872)*sailStates.q + (-0.341834)*sailStates.r + (0.010193)*sailStates.de;
	CD = -0.052840;
	CY = (0.059826)*sailStates.alpha + (-0.026070)*sailStates.beta + (0.028878)*sailStates.p + (0.491627)*sailStates.q + (0.005092)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.258439)*sailStates.alpha + (-0.054536)*sailStates.beta + (-1.186871)*sailStates.p + (9.827078)*sailStates.q + (-0.098898)*sailStates.r + (0.000416)*sailStates.de;
	Cm = (-14.457859)*sailStates.alpha + (0.113496)*sailStates.beta + (8.495173)*sailStates.p + (-133.990967)*sailStates.q + (1.173585)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (0.147999)*sailStates.alpha + (-0.009029)*sailStates.beta + (-0.261258)*sailStates.p + (1.477836)*sailStates.q + (-0.026604)*sailStates.r + (-0.000116)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end