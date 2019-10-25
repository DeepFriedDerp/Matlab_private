function [aeroForces] = paramSpace_4_1_2_3_3_1_2(sailStates,airStates)

	CL = (3.959187)*sailStates.alpha + (0.023122)*sailStates.beta + (-2.426157)*sailStates.p + (32.579525)*sailStates.q + (0.188021)*sailStates.r + (0.010062)*sailStates.de;
	CD = -0.118520;
	CY = (0.057782)*sailStates.alpha + (-0.023279)*sailStates.beta + (-0.168046)*sailStates.p + (0.489619)*sailStates.q + (0.033409)*sailStates.r + (0.000103)*sailStates.de;

	Cl = (1.300874)*sailStates.alpha + (0.077505)*sailStates.beta + (-1.194804)*sailStates.p + (9.783767)*sailStates.q + (-0.046291)*sailStates.r + (0.000487)*sailStates.de;
	Cm = (-14.608263)*sailStates.alpha + (-0.025255)*sailStates.beta + (8.714240)*sailStates.p + (-134.519470)*sailStates.q + (-0.685799)*sailStates.r + (-0.066730)*sailStates.de;
	Cn = (-0.321677)*sailStates.alpha + (-0.021184)*sailStates.beta + (0.567783)*sailStates.p + (-3.653727)*sailStates.q + (-0.056476)*sailStates.r + (-0.000177)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end