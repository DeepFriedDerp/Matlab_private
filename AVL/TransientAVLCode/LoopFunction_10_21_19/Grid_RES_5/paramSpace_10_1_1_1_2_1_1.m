function [aeroForces] = paramSpace_10_1_1_1_2_1_1(sailStates,airStates)

	CL = (5.031720)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.032751)*sailStates.p + (29.152761)*sailStates.q + (-1.264141)*sailStates.r + (0.010542)*sailStates.de;
	CD = -0.925260;
	CY = (0.286983)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.726857)*sailStates.p + (1.113125)*sailStates.q + (0.050709)*sailStates.r + (0.000238)*sailStates.de;

	Cl = (1.408180)*sailStates.alpha + (0.318447)*sailStates.beta + (-0.787178)*sailStates.p + (5.478058)*sailStates.q + (-1.256965)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-15.822468)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.481236)*sailStates.p + (-123.764404)*sailStates.q + (4.294639)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (-1.059312)*sailStates.alpha + (-0.022268)*sailStates.beta + (1.624231)*sailStates.p + (-8.175179)*sailStates.q + (-0.021990)*sailStates.r + (-0.000431)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end