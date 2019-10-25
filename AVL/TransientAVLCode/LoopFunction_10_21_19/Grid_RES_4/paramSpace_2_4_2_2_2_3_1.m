function [aeroForces] = paramSpace_2_4_2_2_2_3_1(sailStates,airStates)

	CL = (4.337293)*sailStates.alpha + (-0.162837)*sailStates.beta + (-2.118491)*sailStates.p + (30.244749)*sailStates.q + (0.726934)*sailStates.r + (0.010433)*sailStates.de;
	CD = -0.409620;
	CY = (-0.080781)*sailStates.alpha + (-0.024904)*sailStates.beta + (0.410751)*sailStates.p + (-0.100923)*sailStates.q + (0.026926)*sailStates.r + (-0.000021)*sailStates.de;

	Cl = (1.022566)*sailStates.alpha + (-0.249641)*sailStates.beta + (-0.813057)*sailStates.p + (5.740502)*sailStates.q + (0.751841)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-14.764309)*sailStates.alpha + (0.629322)*sailStates.beta + (7.569983)*sailStates.p + (-125.105080)*sailStates.q + (-2.452440)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (0.538268)*sailStates.alpha + (-0.011227)*sailStates.beta + (-0.967536)*sailStates.p + (4.615711)*sailStates.q + (-0.010664)*sailStates.r + (0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end