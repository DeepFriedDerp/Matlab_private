function [aeroForces] = paramSpace_4_4_2_2_2_1_1(sailStates,airStates)

	CL = (4.076394)*sailStates.alpha + (0.064619)*sailStates.beta + (-1.996929)*sailStates.p + (28.084652)*sailStates.q + (-0.203641)*sailStates.r + (0.009631)*sailStates.de;
	CD = -0.339830;
	CY = (0.087131)*sailStates.alpha + (-0.025713)*sailStates.beta + (-0.303656)*sailStates.p + (0.301044)*sailStates.q + (0.060390)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (0.932070)*sailStates.alpha + (0.158680)*sailStates.beta + (-0.764744)*sailStates.p + (5.222483)*sailStates.q + (-0.424771)*sailStates.r + (-0.000304)*sailStates.de;
	Cm = (-14.912031)*sailStates.alpha + (-0.309393)*sailStates.beta + (7.531329)*sailStates.p + (-122.964470)*sailStates.q + (0.613773)*sailStates.r + (-0.065627)*sailStates.de;
	Cn = (-0.518947)*sailStates.alpha + (-0.020938)*sailStates.beta + (0.798205)*sailStates.p + (-4.072070)*sailStates.q + (-0.044056)*sailStates.r + (-0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end