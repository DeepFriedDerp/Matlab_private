function [aeroForces] = paramSpace_3_1_2_3_2_1_2(sailStates,airStates)

	CL = (4.164871)*sailStates.alpha + (-0.093709)*sailStates.beta + (-2.530221)*sailStates.p + (33.913769)*sailStates.q + (-0.325854)*sailStates.r + (0.010732)*sailStates.de;
	CD = -0.153930;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.240722)*sailStates.p + (-0.000000)*sailStates.q + (0.015778)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.349823)*sailStates.alpha + (0.098390)*sailStates.beta + (-1.242368)*sailStates.p + (10.109854)*sailStates.q + (-0.392264)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.799392)*sailStates.alpha + (0.414249)*sailStates.beta + (8.836597)*sailStates.p + (-136.150452)*sailStates.q + (1.115082)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.149375)*sailStates.alpha + (-0.009191)*sailStates.beta + (0.605487)*sailStates.p + (-2.960399)*sailStates.q + (-0.008680)*sailStates.r + (-0.000045)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end