function [aeroForces] = paramSpace_1_3_3_3_1_3_3(sailStates,airStates)

	CL = (3.971128)*sailStates.alpha + (0.012838)*sailStates.beta + (-2.695750)*sailStates.p + (34.984631)*sailStates.q + (-0.296169)*sailStates.r + (0.010345)*sailStates.de;
	CD = -0.105440;
	CY = (-0.020124)*sailStates.alpha + (-0.025280)*sailStates.beta + (0.135494)*sailStates.p + (-0.294836)*sailStates.q + (0.026941)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.303492)*sailStates.alpha + (-0.048999)*sailStates.beta + (-1.346475)*sailStates.p + (11.048433)*sailStates.q + (-0.028737)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-14.617789)*sailStates.alpha + (-0.025610)*sailStates.beta + (9.586262)*sailStates.p + (-142.570129)*sailStates.q + (1.044916)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.247868)*sailStates.alpha + (-0.008338)*sailStates.beta + (-0.529387)*sailStates.p + (3.439912)*sailStates.q + (-0.057773)*sailStates.r + (0.000120)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end