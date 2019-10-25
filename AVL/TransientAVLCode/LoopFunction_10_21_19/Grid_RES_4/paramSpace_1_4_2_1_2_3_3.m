function [aeroForces] = paramSpace_1_4_2_1_2_3_3(sailStates,airStates)

	CL = (5.293105)*sailStates.alpha + (-0.261253)*sailStates.beta + (-3.143057)*sailStates.p + (34.370583)*sailStates.q + (0.925502)*sailStates.r + (0.009297)*sailStates.de;
	CD = -1.890340;
	CY = (0.336252)*sailStates.alpha + (-0.022610)*sailStates.beta + (0.699512)*sailStates.p + (0.662186)*sailStates.q + (0.139118)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.675288)*sailStates.alpha + (-0.425077)*sailStates.beta + (-1.752602)*sailStates.p + (13.881357)*sailStates.q + (1.132970)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-14.732449)*sailStates.alpha + (1.037269)*sailStates.beta + (12.328341)*sailStates.p + (-157.701080)*sailStates.q + (-2.945686)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (-0.569423)*sailStates.alpha + (-0.059945)*sailStates.beta + (-1.941253)*sailStates.p + (9.555714)*sailStates.q + (-0.091394)*sailStates.r + (0.000003)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end