function [aeroForces] = paramSpace_3_3_2_2_3_3_1(sailStates,airStates)

	CL = (4.343669)*sailStates.alpha + (-0.086571)*sailStates.beta + (-2.198638)*sailStates.p + (32.867313)*sailStates.q + (1.084806)*sailStates.r + (0.011112)*sailStates.de;
	CD = -0.355960;
	CY = (0.043454)*sailStates.alpha + (-0.025256)*sailStates.beta + (0.404308)*sailStates.p + (0.870359)*sailStates.q + (-0.026530)*sailStates.r + (0.000186)*sailStates.de;

	Cl = (0.985987)*sailStates.alpha + (-0.260181)*sailStates.beta + (-0.876360)*sailStates.p + (6.840819)*sailStates.q + (0.952713)*sailStates.r + (-0.000209)*sailStates.de;
	Cm = (-13.861416)*sailStates.alpha + (0.330189)*sailStates.beta + (7.279614)*sailStates.p + (-126.510948)*sailStates.q + (-3.679842)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.322076)*sailStates.alpha + (0.015451)*sailStates.beta + (-0.895207)*sailStates.p + (3.349711)*sailStates.q + (0.000024)*sailStates.r + (-0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end