function [aeroForces] = paramSpace_1_4_4_1_3_2_2(sailStates,airStates)

	CL = (4.180041)*sailStates.alpha + (0.232361)*sailStates.beta + (-2.413209)*sailStates.p + (35.215485)*sailStates.q + (-1.392413)*sailStates.r + (0.010595)*sailStates.de;
	CD = -0.044700;
	CY = (0.219883)*sailStates.alpha + (-0.020007)*sailStates.beta + (-0.463037)*sailStates.p + (1.664522)*sailStates.q + (-0.091925)*sailStates.r + (0.000349)*sailStates.de;

	Cl = (1.372411)*sailStates.alpha + (0.252339)*sailStates.beta + (-1.076989)*sailStates.p + (9.320885)*sailStates.q + (-0.977680)*sailStates.r + (0.000089)*sailStates.de;
	Cm = (-14.018743)*sailStates.alpha + (-0.733376)*sailStates.beta + (7.553551)*sailStates.p + (-131.445847)*sailStates.q + (4.593410)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (-0.215369)*sailStates.alpha + (0.028715)*sailStates.beta + (0.841219)*sailStates.p + (-4.564431)*sailStates.q + (0.014910)*sailStates.r + (-0.000546)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end