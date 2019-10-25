function [aeroForces] = paramSpace_2_3_3_3_2_3_2(sailStates,airStates)

	CL = (4.226218)*sailStates.alpha + (-0.031166)*sailStates.beta + (-2.549756)*sailStates.p + (34.179840)*sailStates.q + (0.323349)*sailStates.r + (0.010899)*sailStates.de;
	CD = -0.153750;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.240204)*sailStates.p + (0.000000)*sailStates.q + (0.015744)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.267459)*sailStates.alpha + (-0.127191)*sailStates.beta + (-1.186389)*sailStates.p + (9.378117)*sailStates.q + (0.394858)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-15.024962)*sailStates.alpha + (0.137966)*sailStates.beta + (8.903251)*sailStates.p + (-137.194580)*sailStates.q + (-1.106672)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.165287)*sailStates.alpha + (-0.007423)*sailStates.beta + (-0.600525)*sailStates.p + (2.905834)*sailStates.q + (-0.008425)*sailStates.r + (0.000045)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end