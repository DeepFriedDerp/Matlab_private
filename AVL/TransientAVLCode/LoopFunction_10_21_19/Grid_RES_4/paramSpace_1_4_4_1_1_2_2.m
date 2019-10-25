function [aeroForces] = paramSpace_1_4_4_1_1_2_2(sailStates,airStates)

	CL = (3.825549)*sailStates.alpha + (0.113778)*sailStates.beta + (-2.511509)*sailStates.p + (34.666939)*sailStates.q + (-0.539826)*sailStates.r + (0.010613)*sailStates.de;
	CD = 0.044020;
	CY = (-0.200697)*sailStates.alpha + (-0.029565)*sailStates.beta + (0.066107)*sailStates.p + (-1.664521)*sailStates.q + (0.012971)*sailStates.r + (-0.000351)*sailStates.de;

	Cl = (1.089159)*sailStates.alpha + (0.065573)*sailStates.beta + (-1.138135)*sailStates.p + (9.147435)*sailStates.q + (-0.278005)*sailStates.r + (0.000311)*sailStates.de;
	Cm = (-14.046412)*sailStates.alpha + (-0.342146)*sailStates.beta + (8.694031)*sailStates.p + (-136.195908)*sailStates.q + (1.838744)*sailStates.r + (-0.066898)*sailStates.de;
	Cn = (0.367761)*sailStates.alpha + (0.015808)*sailStates.beta + (-0.275027)*sailStates.p + (3.010087)*sailStates.q + (-0.064998)*sailStates.r + (0.000469)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end