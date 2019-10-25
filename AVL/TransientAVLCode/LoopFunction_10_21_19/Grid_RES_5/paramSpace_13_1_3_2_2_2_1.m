function [aeroForces] = paramSpace_13_1_3_2_2_2_1(sailStates,airStates)

	CL = (4.034559)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.341762)*sailStates.p + (35.158653)*sailStates.q + (1.249288)*sailStates.r + (0.010951)*sailStates.de;
	CD = -0.075250;
	CY = (0.037423)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.368776)*sailStates.p + (0.546500)*sailStates.q + (-0.065006)*sailStates.r + (0.000116)*sailStates.de;

	Cl = (1.107734)*sailStates.alpha + (-0.206186)*sailStates.beta + (-1.022220)*sailStates.p + (8.692560)*sailStates.q + (0.974561)*sailStates.r + (0.000086)*sailStates.de;
	Cm = (-13.104107)*sailStates.alpha + (0.000000)*sailStates.beta + (7.441359)*sailStates.p + (-130.238892)*sailStates.q + (-4.199803)*sailStates.r + (-0.067853)*sailStates.de;
	Cn = (0.054145)*sailStates.alpha + (0.036356)*sailStates.beta + (-0.700319)*sailStates.p + (2.215492)*sailStates.q + (-0.016639)*sailStates.r + (-0.000105)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end