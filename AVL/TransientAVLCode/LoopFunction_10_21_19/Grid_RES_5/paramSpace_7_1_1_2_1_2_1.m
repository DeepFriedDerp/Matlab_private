function [aeroForces] = paramSpace_7_1_1_2_1_2_1(sailStates,airStates)

	CL = (4.212826)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.356766)*sailStates.p + (32.900234)*sailStates.q + (0.467591)*sailStates.r + (0.010904)*sailStates.de;
	CD = -0.112860;
	CY = (-0.077534)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.262187)*sailStates.p + (-0.438541)*sailStates.q + (0.009202)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.225874)*sailStates.alpha + (-0.113342)*sailStates.beta + (-1.036842)*sailStates.p + (8.069449)*sailStates.q + (0.443977)*sailStates.r + (0.000068)*sailStates.de;
	Cm = (-14.956087)*sailStates.alpha + (0.000000)*sailStates.beta + (8.185269)*sailStates.p + (-131.751755)*sailStates.q + (-1.554252)*sailStates.r + (-0.069836)*sailStates.de;
	Cn = (0.286506)*sailStates.alpha + (-0.003958)*sailStates.beta + (-0.621787)*sailStates.p + (3.377358)*sailStates.q + (-0.005263)*sailStates.r + (0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end