function [aeroForces] = paramSpace_2_2_2_2_2_2_1(sailStates,airStates)

	CL = (5.406711)*sailStates.alpha + (-4.092117)*sailStates.beta + (-3.487698)*sailStates.p + (47.995605)*sailStates.q + (2.304643)*sailStates.r + (0.010477)*sailStates.de;
	CD = -6.402150;
	CY = (1.835665)*sailStates.alpha + (-0.277994)*sailStates.beta + (0.359036)*sailStates.p + (15.826509)*sailStates.q + (-0.036059)*sailStates.r + (0.003015)*sailStates.de;

	Cl = (-5.898598)*sailStates.alpha + (-1.298291)*sailStates.beta + (-1.698169)*sailStates.p + (14.482601)*sailStates.q + (2.565814)*sailStates.r + (0.001266)*sailStates.de;
	Cm = (6.821816)*sailStates.alpha + (18.671631)*sailStates.beta + (10.795808)*sailStates.p + (-152.363464)*sailStates.q + (-8.199974)*sailStates.r + (-0.055389)*sailStates.de;
	Cn = (-1.926676)*sailStates.alpha + (0.396485)*sailStates.beta + (-1.006567)*sailStates.p + (-8.689289)*sailStates.q + (-0.205628)*sailStates.r + (-0.003961)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end