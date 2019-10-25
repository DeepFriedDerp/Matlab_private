function [aeroForces] = paramSpace_1_2_2_2_3_1_1(sailStates,airStates)

	CL = (4.790603)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.160805)*sailStates.p + (35.267742)*sailStates.q + (-1.956403)*sailStates.r + (0.011197)*sailStates.de;
	CD = -0.629160;
	CY = (0.195715)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.747335)*sailStates.p + (0.491415)*sailStates.q + (-0.131775)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.417603)*sailStates.alpha + (0.354065)*sailStates.beta + (-0.863554)*sailStates.p + (7.710330)*sailStates.q + (-1.598315)*sailStates.r + (-0.000222)*sailStates.de;
	Cm = (-12.722627)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.217067)*sailStates.p + (-123.667763)*sailStates.q + (6.513287)*sailStates.r + (-0.067234)*sailStates.de;
	Cn = (-0.696649)*sailStates.alpha + (0.062431)*sailStates.beta + (1.562875)*sailStates.p + (-7.062037)*sailStates.q + (0.020600)*sailStates.r + (-0.000253)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end