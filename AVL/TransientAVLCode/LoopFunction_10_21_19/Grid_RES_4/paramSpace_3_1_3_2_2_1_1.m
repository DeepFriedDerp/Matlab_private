function [aeroForces] = paramSpace_3_1_3_2_2_1_1(sailStates,airStates)

	CL = (4.337293)*sailStates.alpha + (-0.162837)*sailStates.beta + (-2.118491)*sailStates.p + (30.244747)*sailStates.q + (-0.726934)*sailStates.r + (0.010433)*sailStates.de;
	CD = -0.409620;
	CY = (0.080781)*sailStates.alpha + (-0.024668)*sailStates.beta + (-0.410751)*sailStates.p + (0.100923)*sailStates.q + (0.026926)*sailStates.r + (0.000021)*sailStates.de;

	Cl = (1.191625)*sailStates.alpha + (0.150925)*sailStates.beta + (-0.910750)*sailStates.p + (6.949064)*sailStates.q + (-0.745396)*sailStates.r + (-0.000055)*sailStates.de;
	Cm = (-14.764309)*sailStates.alpha + (0.629321)*sailStates.beta + (7.569983)*sailStates.p + (-125.105080)*sailStates.q + (2.452441)*sailStates.r + (-0.067932)*sailStates.de;
	Cn = (-0.496574)*sailStates.alpha + (-0.015027)*sailStates.beta + (0.973939)*sailStates.p + (-4.694924)*sailStates.q + (-0.011086)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end