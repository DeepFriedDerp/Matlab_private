function [aeroForces] = paramSpace_1_1_2_2_1_3_2(sailStates,airStates)

	CL = (4.220627)*sailStates.alpha + (0.049989)*sailStates.beta + (-2.406045)*sailStates.p + (31.310823)*sailStates.q + (0.233289)*sailStates.r + (0.009726)*sailStates.de;
	CD = -0.402380;
	CY = (-0.085809)*sailStates.alpha + (-0.022301)*sailStates.beta + (0.361680)*sailStates.p + (-0.756269)*sailStates.q + (0.071970)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.431672)*sailStates.alpha + (-0.135748)*sailStates.beta + (-1.190713)*sailStates.p + (9.435964)*sailStates.q + (0.414140)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-15.082964)*sailStates.alpha + (-0.194944)*sailStates.beta + (9.032172)*sailStates.p + (-134.899979)*sailStates.q + (-0.673950)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.428443)*sailStates.alpha + (-0.041332)*sailStates.beta + (-1.012385)*sailStates.p + (5.939095)*sailStates.q + (-0.071939)*sailStates.r + (0.000300)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end