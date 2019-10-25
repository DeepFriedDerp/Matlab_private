function [aeroForces] = paramSpace_9_1_2_2_1_2_2(sailStates,airStates)

	CL = (4.283871)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.797093)*sailStates.p + (37.056446)*sailStates.q + (0.832220)*sailStates.r + (0.011282)*sailStates.de;
	CD = -0.152690;
	CY = (-0.023656)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.358003)*sailStates.p + (-0.438542)*sailStates.q + (-0.012486)*sailStates.r + (-0.000095)*sailStates.de;

	Cl = (1.445294)*sailStates.alpha + (-0.161249)*sailStates.beta + (-1.389677)*sailStates.p + (11.501012)*sailStates.q + (0.712080)*sailStates.r + (0.000625)*sailStates.de;
	Cm = (-14.708249)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.449126)*sailStates.p + (-143.320496)*sailStates.q + (-2.810228)*sailStates.r + (-0.071014)*sailStates.de;
	Cn = (0.015784)*sailStates.alpha + (0.005631)*sailStates.beta + (-0.752376)*sailStates.p + (3.637539)*sailStates.q + (0.003055)*sailStates.r + (0.000199)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end