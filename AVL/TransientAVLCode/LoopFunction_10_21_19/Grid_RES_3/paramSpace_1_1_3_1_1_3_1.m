function [aeroForces] = paramSpace_1_1_3_1_1_3_1(sailStates,airStates)

	CL = (6.611349)*sailStates.alpha + (0.415802)*sailStates.beta + (-1.518697)*sailStates.p + (20.399977)*sailStates.q + (2.115743)*sailStates.r + (0.008947)*sailStates.de;
	CD = -2.737700;
	CY = (-0.683881)*sailStates.alpha + (-0.019694)*sailStates.beta + (1.219088)*sailStates.p + (-2.260756)*sailStates.q + (0.214743)*sailStates.r + (-0.000471)*sailStates.de;

	Cl = (1.987383)*sailStates.alpha + (-0.387104)*sailStates.beta + (-0.483811)*sailStates.p + (1.677538)*sailStates.q + (2.111632)*sailStates.r + (-0.000571)*sailStates.de;
	Cm = (-18.269863)*sailStates.alpha + (-1.656367)*sailStates.beta + (7.290697)*sailStates.p + (-112.748634)*sailStates.q + (-6.962095)*sailStates.r + (-0.065445)*sailStates.de;
	Cn = (2.578052)*sailStates.alpha + (-0.105415)*sailStates.beta + (-2.744635)*sailStates.p + (14.021280)*sailStates.q + (-0.096561)*sailStates.r + (0.000823)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end