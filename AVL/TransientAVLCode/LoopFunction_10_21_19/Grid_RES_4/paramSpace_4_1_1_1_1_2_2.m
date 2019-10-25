function [aeroForces] = paramSpace_4_1_1_1_1_2_2(sailStates,airStates)

	CL = (4.180041)*sailStates.alpha + (0.232361)*sailStates.beta + (-2.413209)*sailStates.p + (35.215485)*sailStates.q + (1.392414)*sailStates.r + (0.010595)*sailStates.de;
	CD = -0.044700;
	CY = (-0.219883)*sailStates.alpha + (-0.029565)*sailStates.beta + (0.463037)*sailStates.p + (-1.664522)*sailStates.q + (-0.091925)*sailStates.r + (-0.000349)*sailStates.de;

	Cl = (1.512155)*sailStates.alpha + (-0.072172)*sailStates.beta + (-1.171395)*sailStates.p + (10.508765)*sailStates.q + (0.996330)*sailStates.r + (0.000343)*sailStates.de;
	Cm = (-14.018743)*sailStates.alpha + (-0.733376)*sailStates.beta + (7.553551)*sailStates.p + (-131.445847)*sailStates.q + (-4.593410)*sailStates.r + (-0.066427)*sailStates.de;
	Cn = (0.142693)*sailStates.alpha + (0.035834)*sailStates.beta + (-0.822441)*sailStates.p + (4.328147)*sailStates.q + (0.011200)*sailStates.r + (0.000546)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end