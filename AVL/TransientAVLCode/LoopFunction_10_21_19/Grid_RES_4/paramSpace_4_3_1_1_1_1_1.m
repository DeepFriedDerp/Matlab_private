function [aeroForces] = paramSpace_4_3_1_1_1_1_1(sailStates,airStates)

	CL = (4.790748)*sailStates.alpha + (0.111780)*sailStates.beta + (-1.409450)*sailStates.p + (20.287836)*sailStates.q + (-1.192798)*sailStates.r + (0.008826)*sailStates.de;
	CD = -1.645770;
	CY = (0.147208)*sailStates.alpha + (-0.024015)*sailStates.beta + (-0.672358)*sailStates.p + (-1.002333)*sailStates.q + (0.133848)*sailStates.r + (-0.000209)*sailStates.de;

	Cl = (0.348286)*sailStates.alpha + (0.404865)*sailStates.beta + (-0.363829)*sailStates.p + (0.960381)*sailStates.q + (-1.379320)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-15.159573)*sailStates.alpha + (-0.472949)*sailStates.beta + (6.333733)*sailStates.p + (-108.591927)*sailStates.q + (3.912210)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-1.392616)*sailStates.alpha + (-0.073086)*sailStates.beta + (1.590983)*sailStates.p + (-6.211386)*sailStates.q + (-0.028249)*sailStates.r + (0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end