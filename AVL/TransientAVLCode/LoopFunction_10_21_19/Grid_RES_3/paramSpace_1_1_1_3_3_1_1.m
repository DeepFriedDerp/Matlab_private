function [aeroForces] = paramSpace_1_1_1_3_3_1_1(sailStates,airStates)

	CL = (4.249595)*sailStates.alpha + (-0.327734)*sailStates.beta + (-2.263776)*sailStates.p + (35.076496)*sailStates.q + (-1.581134)*sailStates.r + (0.010788)*sailStates.de;
	CD = -0.244330;
	CY = (0.105677)*sailStates.alpha + (-0.025711)*sailStates.beta + (-0.571279)*sailStates.p + (0.318255)*sailStates.q + (-0.100762)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.341269)*sailStates.alpha + (0.180968)*sailStates.beta + (-1.007346)*sailStates.p + (8.944908)*sailStates.q + (-1.281537)*sailStates.r + (0.000085)*sailStates.de;
	Cm = (-12.751796)*sailStates.alpha + (1.281136)*sailStates.beta + (6.891119)*sailStates.p + (-126.937798)*sailStates.q + (5.301208)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.289016)*sailStates.alpha + (0.049848)*sailStates.beta + (1.127077)*sailStates.p + (-4.700339)*sailStates.q + (0.003894)*sailStates.r + (-0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end