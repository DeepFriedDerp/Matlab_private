function [aeroForces] = paramSpace_1_1_1_2_1_2_2(sailStates,airStates)

	CL = (3.694349)*sailStates.alpha + (-0.207777)*sailStates.beta + (-2.482539)*sailStates.p + (34.961418)*sailStates.q + (-0.797908)*sailStates.r + (0.010348)*sailStates.de;
	CD = 0.101780;
	CY = (-0.093552)*sailStates.alpha + (-0.022144)*sailStates.beta + (-0.121381)*sailStates.p + (-0.756270)*sailStates.q + (-0.024063)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.199686)*sailStates.alpha + (0.036280)*sailStates.beta + (-1.214786)*sailStates.p + (10.389258)*sailStates.q + (-0.557678)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-13.229604)*sailStates.alpha + (0.844122)*sailStates.beta + (8.353698)*sailStates.p + (-134.899979)*sailStates.q + (2.736974)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.268165)*sailStates.alpha + (0.010557)*sailStates.beta + (0.075734)*sailStates.p + (1.146562)*sailStates.q + (-0.048192)*sailStates.r + (0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end