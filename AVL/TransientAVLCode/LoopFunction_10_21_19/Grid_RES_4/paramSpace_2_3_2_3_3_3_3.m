function [aeroForces] = paramSpace_2_3_2_3_3_3_3(sailStates,airStates)

	CL = (4.118828)*sailStates.alpha + (-0.016349)*sailStates.beta + (-2.804721)*sailStates.p + (36.332367)*sailStates.q + (0.150151)*sailStates.r + (0.010995)*sailStates.de;
	CD = -0.099520;
	CY = (0.084128)*sailStates.alpha + (-0.024755)*sailStates.beta + (0.134106)*sailStates.p + (0.563441)*sailStates.q + (0.008770)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.319151)*sailStates.alpha + (-0.092765)*sailStates.beta + (-1.395728)*sailStates.p + (11.360263)*sailStates.q + (0.236605)*sailStates.r + (0.000634)*sailStates.de;
	Cm = (-14.728403)*sailStates.alpha + (0.066086)*sailStates.beta + (9.711414)*sailStates.p + (-144.107040)*sailStates.q + (-0.506080)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.007533)*sailStates.alpha + (-0.005667)*sailStates.beta + (-0.405258)*sailStates.p + (1.758345)*sailStates.q + (-0.005050)*sailStates.r + (-0.000119)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end