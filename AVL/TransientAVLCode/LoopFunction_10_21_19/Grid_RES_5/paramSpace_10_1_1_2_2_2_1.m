function [aeroForces] = paramSpace_10_1_1_2_2_2_1(sailStates,airStates)

	CL = (4.160458)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.373382)*sailStates.p + (33.907963)*sailStates.q + (0.743538)*sailStates.r + (0.011140)*sailStates.de;
	CD = -0.076010;
	CY = (0.038028)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.236552)*sailStates.p + (0.466417)*sailStates.q + (-0.016591)*sailStates.r + (0.000100)*sailStates.de;

	Cl = (1.146780)*sailStates.alpha + (-0.137124)*sailStates.beta + (-1.041294)*sailStates.p + (8.347463)*sailStates.q + (0.599049)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-14.452191)*sailStates.alpha + (0.000000)*sailStates.beta + (7.969052)*sailStates.p + (-131.613632)*sailStates.q + (-2.496119)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (0.078937)*sailStates.alpha + (0.009589)*sailStates.beta + (-0.502626)*sailStates.p + (1.883691)*sailStates.q + (-0.001834)*sailStates.r + (-0.000078)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end