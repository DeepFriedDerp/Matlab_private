function [aeroForces] = paramSpace_1_2_1_1_2_2_2(sailStates,airStates)

	CL = (8.176208)*sailStates.alpha + (-0.510467)*sailStates.beta + (-2.553406)*sailStates.p + (29.348045)*sailStates.q + (0.183921)*sailStates.r + (0.008611)*sailStates.de;
	CD = -5.127760;
	CY = (2.043976)*sailStates.alpha + (0.003774)*sailStates.beta + (-0.355383)*sailStates.p + (16.706825)*sailStates.q + (-0.044420)*sailStates.r + (0.003556)*sailStates.de;

	Cl = (-1.922783)*sailStates.alpha + (-0.499271)*sailStates.beta + (-1.364756)*sailStates.p + (11.324040)*sailStates.q + (0.876106)*sailStates.r + (0.000304)*sailStates.de;
	Cm = (-13.332877)*sailStates.alpha + (2.447192)*sailStates.beta + (9.135127)*sailStates.p + (-137.362411)*sailStates.q + (-0.866407)*sailStates.r + (-0.068328)*sailStates.de;
	Cn = (-2.131358)*sailStates.alpha + (-0.084833)*sailStates.beta + (0.140263)*sailStates.p + (-12.596291)*sailStates.q + (0.153138)*sailStates.r + (-0.004738)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end