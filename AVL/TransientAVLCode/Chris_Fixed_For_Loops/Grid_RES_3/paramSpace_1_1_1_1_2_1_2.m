function [aeroForces] = paramSpace_1_1_1_1_2_1_2(sailStates,airStates)

	CL = (2.436401)*sailStates.alpha + (-0.035312)*sailStates.beta + (-4.365248)*sailStates.p + (48.460411)*sailStates.q + (-0.604620)*sailStates.r + (0.011082)*sailStates.de;
	CD = -0.154980;
	CY = (0.180340)*sailStates.alpha + (-0.026795)*sailStates.beta + (0.021749)*sailStates.p + (1.326087)*sailStates.q + (0.003709)*sailStates.r + (0.000292)*sailStates.de;

	Cl = (0.812363)*sailStates.alpha + (-0.091736)*sailStates.beta + (-2.758352)*sailStates.p + (24.468815)*sailStates.q + (-0.295282)*sailStates.r + (0.003043)*sailStates.de;
	Cm = (-8.911767)*sailStates.alpha + (0.129848)*sailStates.beta + (15.155111)*sailStates.p + (-189.247437)*sailStates.q + (2.105059)*sailStates.r + (-0.074599)*sailStates.de;
	Cn = (-0.235095)*sailStates.alpha + (-0.015302)*sailStates.beta + (-0.564006)*sailStates.p + (3.680837)*sailStates.q + (-0.065763)*sailStates.r + (-0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end