function [aeroForces] = paramSpace_1_1_3_2_1_2_1(sailStates,airStates)

	CL = (3.835571)*sailStates.alpha + (-0.096536)*sailStates.beta + (-2.115677)*sailStates.p + (31.543165)*sailStates.q + (-0.529553)*sailStates.r + (0.010528)*sailStates.de;
	CD = 0.048210;
	CY = (-0.123881)*sailStates.alpha + (-0.022497)*sailStates.beta + (-0.013836)*sailStates.p + (-1.027328)*sailStates.q + (-0.002537)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (1.027576)*sailStates.alpha + (0.019285)*sailStates.beta + (-0.901420)*sailStates.p + (7.254254)*sailStates.q + (-0.302986)*sailStates.r + (-0.000021)*sailStates.de;
	Cm = (-13.980299)*sailStates.alpha + (0.291506)*sailStates.beta + (7.229679)*sailStates.p + (-124.672379)*sailStates.q + (1.784972)*sailStates.r + (-0.066497)*sailStates.de;
	Cn = (0.211086)*sailStates.alpha + (0.004086)*sailStates.beta + (-0.050635)*sailStates.p + (1.296463)*sailStates.q + (-0.034407)*sailStates.r + (0.000283)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end