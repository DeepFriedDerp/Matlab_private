function [aeroForces] = paramSpace_1_3_3_1_1_3_1(sailStates,airStates)

	CL = (6.611349)*sailStates.alpha + (-0.415802)*sailStates.beta + (-1.518697)*sailStates.p + (20.399977)*sailStates.q + (2.115744)*sailStates.r + (0.008947)*sailStates.de;
	CD = -2.737700;
	CY = (-0.683881)*sailStates.alpha + (-0.029968)*sailStates.beta + (1.219088)*sailStates.p + (-2.260756)*sailStates.q + (0.214743)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (1.807782)*sailStates.alpha + (-0.646973)*sailStates.beta + (-0.399159)*sailStates.p + (0.616670)*sailStates.q + (2.126458)*sailStates.r + (-0.000796)*sailStates.de;
	Cm = (-18.269863)*sailStates.alpha + (1.656367)*sailStates.beta + (7.290697)*sailStates.p + (-112.748650)*sailStates.q + (-6.962098)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (2.670717)*sailStates.alpha + (-0.076921)*sailStates.beta + (-2.729708)*sailStates.p + (13.834220)*sailStates.q + (-0.093947)*sailStates.r + (0.000823)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end