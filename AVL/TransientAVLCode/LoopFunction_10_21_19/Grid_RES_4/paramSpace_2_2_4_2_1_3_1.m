function [aeroForces] = paramSpace_2_2_4_2_1_3_1(sailStates,airStates)

	CL = (4.654669)*sailStates.alpha + (0.077815)*sailStates.beta + (-2.146182)*sailStates.p + (30.435522)*sailStates.q + (0.941566)*sailStates.r + (0.010658)*sailStates.de;
	CD = -0.560150;
	CY = (-0.199348)*sailStates.alpha + (-0.024758)*sailStates.beta + (0.564255)*sailStates.p + (-0.870359)*sailStates.q + (0.036891)*sailStates.r + (-0.000186)*sailStates.de;

	Cl = (1.333619)*sailStates.alpha + (-0.225839)*sailStates.beta + (-0.892461)*sailStates.p + (6.606238)*sailStates.q + (0.957166)*sailStates.r + (-0.000122)*sailStates.de;
	Cm = (-15.503423)*sailStates.alpha + (-0.332316)*sailStates.beta + (7.731069)*sailStates.p + (-126.510948)*sailStates.q + (-3.208023)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (0.721249)*sailStates.alpha + (-0.017005)*sailStates.beta + (-1.270313)*sailStates.p + (6.417782)*sailStates.q + (-0.016875)*sailStates.r + (0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end