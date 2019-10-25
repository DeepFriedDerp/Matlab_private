function [aeroForces] = paramSpace_1_2_1_2_2_2_1(sailStates,airStates)

	CL = (3.820886)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.111129)*sailStates.p + (32.007599)*sailStates.q + (-0.752033)*sailStates.r + (0.010462)*sailStates.de;
	CD = 0.073490;
	CY = (-0.003795)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.174888)*sailStates.p + (-0.267956)*sailStates.q + (-0.030812)*sailStates.r + (-0.000057)*sailStates.de;

	Cl = (0.991111)*sailStates.alpha + (0.098130)*sailStates.beta + (-0.853824)*sailStates.p + (6.831231)*sailStates.q + (-0.521689)*sailStates.r + (-0.000178)*sailStates.de;
	Cm = (-13.554971)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.033081)*sailStates.p + (-124.628265)*sailStates.q + (2.562166)*sailStates.r + (-0.067322)*sailStates.de;
	Cn = (-0.019390)*sailStates.alpha + (0.017303)*sailStates.beta + (0.270482)*sailStates.p + (-0.553791)*sailStates.q + (-0.017996)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end