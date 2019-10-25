function [aeroForces] = paramSpace_3_3_1_2_3_1_1(sailStates,airStates)

	CL = (4.654669)*sailStates.alpha + (0.077815)*sailStates.beta + (-2.146182)*sailStates.p + (30.435522)*sailStates.q + (-0.941566)*sailStates.r + (0.010658)*sailStates.de;
	CD = -0.560150;
	CY = (0.199348)*sailStates.alpha + (-0.025194)*sailStates.beta + (-0.564255)*sailStates.p + (0.870359)*sailStates.q + (0.036891)*sailStates.r + (0.000186)*sailStates.de;

	Cl = (1.276567)*sailStates.alpha + (0.267684)*sailStates.beta + (-0.859810)*sailStates.p + (6.202359)*sailStates.q + (-0.959263)*sailStates.r + (-0.000209)*sailStates.de;
	Cm = (-15.503422)*sailStates.alpha + (-0.332316)*sailStates.beta + (7.731069)*sailStates.p + (-126.510948)*sailStates.q + (3.208023)*sailStates.r + (-0.069020)*sailStates.de;
	Cn = (-0.739146)*sailStates.alpha + (-0.015342)*sailStates.beta + (1.268173)*sailStates.p + (-6.391311)*sailStates.q + (-0.016738)*sailStates.r + (-0.000335)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end