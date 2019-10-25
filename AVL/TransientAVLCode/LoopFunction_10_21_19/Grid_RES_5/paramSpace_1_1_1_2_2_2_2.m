function [aeroForces] = paramSpace_1_1_1_2_2_2_2(sailStates,airStates)

	CL = (3.679488)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.565744)*sailStates.p + (35.071785)*sailStates.q + (-0.885003)*sailStates.r + (0.009881)*sailStates.de;
	CD = 0.083470;
	CY = (0.061105)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.140627)*sailStates.p + (0.596614)*sailStates.q + (-0.035127)*sailStates.r + (0.000126)*sailStates.de;

	Cl = (1.246630)*sailStates.alpha + (0.046873)*sailStates.beta + (-1.277473)*sailStates.p + (11.025872)*sailStates.q + (-0.532807)*sailStates.r + (0.000561)*sailStates.de;
	Cm = (-13.491903)*sailStates.alpha + (0.000000)*sailStates.beta + (8.714484)*sailStates.p + (-138.535995)*sailStates.q + (3.030558)*sailStates.r + (-0.066877)*sailStates.de;
	Cn = (0.201356)*sailStates.alpha + (0.011687)*sailStates.beta + (0.011812)*sailStates.p + (0.699770)*sailStates.q + (-0.050636)*sailStates.r + (-0.000150)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end