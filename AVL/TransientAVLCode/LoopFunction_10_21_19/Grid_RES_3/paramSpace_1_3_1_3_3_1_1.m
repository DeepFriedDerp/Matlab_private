function [aeroForces] = paramSpace_1_3_1_3_3_1_1(sailStates,airStates)

	CL = (4.249595)*sailStates.alpha + (0.327734)*sailStates.beta + (-2.263776)*sailStates.p + (35.076496)*sailStates.q + (-1.581134)*sailStates.r + (0.010788)*sailStates.de;
	CD = -0.244330;
	CY = (0.105677)*sailStates.alpha + (-0.023950)*sailStates.beta + (-0.571279)*sailStates.p + (0.318255)*sailStates.q + (-0.100762)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.213238)*sailStates.alpha + (0.358299)*sailStates.beta + (-0.922728)*sailStates.p + (7.884042)*sailStates.q + (-1.266515)*sailStates.r + (-0.000142)*sailStates.de;
	Cm = (-12.751796)*sailStates.alpha + (-1.281136)*sailStates.beta + (6.891119)*sailStates.p + (-126.937798)*sailStates.q + (5.301208)*sailStates.r + (-0.066708)*sailStates.de;
	Cn = (-0.376937)*sailStates.alpha + (0.045240)*sailStates.beta + (1.141997)*sailStates.p + (-4.887399)*sailStates.q + (0.006543)*sailStates.r + (-0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end