function [aeroForces] = paramSpace_1_1_1_3_3_3_3(sailStates,airStates)

	CL = (3.845804)*sailStates.alpha + (-0.077081)*sailStates.beta + (-2.680224)*sailStates.p + (35.190926)*sailStates.q + (-0.443482)*sailStates.r + (0.010212)*sailStates.de;
	CD = -0.014010;
	CY = (0.079265)*sailStates.alpha + (-0.026671)*sailStates.beta + (-0.018188)*sailStates.p + (0.665001)*sailStates.q + (-0.003270)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.348390)*sailStates.alpha + (-0.046858)*sailStates.beta + (-1.393783)*sailStates.p + (11.809292)*sailStates.q + (-0.204124)*sailStates.r + (0.000750)*sailStates.de;
	Cm = (-14.089558)*sailStates.alpha + (0.308960)*sailStates.beta + (9.306512)*sailStates.p + (-141.044128)*sailStates.q + (1.541658)*sailStates.r + (-0.068108)*sailStates.de;
	Cn = (0.136697)*sailStates.alpha + (-0.006393)*sailStates.beta + (-0.211190)*sailStates.p + (1.417354)*sailStates.q + (-0.029991)*sailStates.r + (-0.000153)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end