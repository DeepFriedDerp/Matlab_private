function [aeroForces] = paramSpace_4_2_2_2_3_2_1(sailStates,airStates)

	CL = (3.809613)*sailStates.alpha + (0.049181)*sailStates.beta + (-2.115338)*sailStates.p + (31.830732)*sailStates.q + (0.632919)*sailStates.r + (0.010498)*sailStates.de;
	CD = 0.061520;
	CY = (0.122688)*sailStates.alpha + (-0.023888)*sailStates.beta + (0.046476)*sailStates.p + (1.057313)*sailStates.q + (-0.009283)*sailStates.r + (0.000223)*sailStates.de;

	Cl = (0.976166)*sailStates.alpha + (-0.052840)*sailStates.beta + (-0.874874)*sailStates.p + (7.001977)*sailStates.q + (0.382354)*sailStates.r + (-0.000084)*sailStates.de;
	Cm = (-13.779564)*sailStates.alpha + (-0.171866)*sailStates.beta + (7.183815)*sailStates.p + (-125.069839)*sailStates.q + (-2.147887)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (-0.193763)*sailStates.alpha + (0.011014)*sailStates.beta + (-0.004386)*sailStates.p + (-1.163852)*sailStates.q + (-0.040545)*sailStates.r + (-0.000296)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end