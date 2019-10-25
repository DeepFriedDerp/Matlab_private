function [aeroForces] = paramSpace_1_3_2_3_1_3_2(sailStates,airStates)

	CL = (4.011126)*sailStates.alpha + (0.010492)*sailStates.beta + (-2.454142)*sailStates.p + (32.858719)*sailStates.q + (-0.088927)*sailStates.r + (0.010198)*sailStates.de;
	CD = -0.126360;
	CY = (-0.058338)*sailStates.alpha + (-0.026070)*sailStates.beta + (0.185765)*sailStates.p + (-0.491626)*sailStates.q + (0.032755)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.186078)*sailStates.alpha + (-0.069406)*sailStates.beta + (-1.118375)*sailStates.p + (8.720612)*sailStates.q + (0.123387)*sailStates.r + (0.000246)*sailStates.de;
	Cm = (-14.692726)*sailStates.alpha + (-0.009611)*sailStates.beta + (8.794865)*sailStates.p + (-135.234604)*sailStates.q + (0.350185)*sailStates.r + (-0.067514)*sailStates.de;
	Cn = (0.303545)*sailStates.alpha + (-0.006818)*sailStates.beta + (-0.575218)*sailStates.p + (3.520945)*sailStates.q + (-0.044898)*sailStates.r + (0.000187)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end