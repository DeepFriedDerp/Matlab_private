function [aeroForces] = paramSpace_2_4_1_1_2_1_3(sailStates,airStates)

	CL = (6.103446)*sailStates.alpha + (0.636213)*sailStates.beta + (-3.489310)*sailStates.p + (44.554951)*sailStates.q + (-2.684343)*sailStates.r + (0.011824)*sailStates.de;
	CD = -2.386550;
	CY = (-0.405531)*sailStates.alpha + (-0.024479)*sailStates.beta + (-1.183555)*sailStates.p + (0.221996)*sailStates.q + (-0.077598)*sailStates.r + (0.000048)*sailStates.de;

	Cl = (1.967541)*sailStates.alpha + (0.757033)*sailStates.beta + (-1.890826)*sailStates.p + (16.517435)*sailStates.q + (-2.434375)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-12.331248)*sailStates.alpha + (-2.545459)*sailStates.beta + (11.143937)*sailStates.p + (-160.446381)*sailStates.q + (9.130904)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (1.389687)*sailStates.alpha + (0.034719)*sailStates.beta + (2.521584)*sailStates.p + (-11.057897)*sailStates.q + (0.013493)*sailStates.r + (-0.000290)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end