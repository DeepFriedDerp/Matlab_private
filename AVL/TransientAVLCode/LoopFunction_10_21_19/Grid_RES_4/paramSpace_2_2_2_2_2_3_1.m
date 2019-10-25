function [aeroForces] = paramSpace_2_2_2_2_2_3_1(sailStates,airStates)

	CL = (4.398255)*sailStates.alpha + (0.054212)*sailStates.beta + (-2.138024)*sailStates.p + (30.510946)*sailStates.q + (0.724362)*sailStates.r + (0.010597)*sailStates.de;
	CD = -0.409220;
	CY = (-0.080772)*sailStates.alpha + (-0.024937)*sailStates.beta + (0.410118)*sailStates.p + (-0.100924)*sailStates.q + (0.026884)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.153038)*sailStates.alpha + (-0.184429)*sailStates.beta + (-0.887420)*sailStates.p + (6.621209)*sailStates.q + (0.745710)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-14.990506)*sailStates.alpha + (-0.209490)*sailStates.beta + (7.636613)*sailStates.p + (-126.149185)*sailStates.q + (-2.443645)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.512094)*sailStates.alpha + (-0.013801)*sailStates.beta + (-0.970949)*sailStates.p + (4.666743)*sailStates.q + (-0.010970)*sailStates.r + (0.000110)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end