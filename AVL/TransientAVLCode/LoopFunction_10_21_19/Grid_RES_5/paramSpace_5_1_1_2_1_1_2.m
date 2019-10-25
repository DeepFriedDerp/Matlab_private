function [aeroForces] = paramSpace_5_1_1_2_1_1_2(sailStates,airStates)

	CL = (4.084948)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.792712)*sailStates.p + (37.833447)*sailStates.q + (-1.023238)*sailStates.r + (0.011222)*sailStates.de;
	CD = -0.079750;
	CY = (-0.071981)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.343938)*sailStates.p + (-0.322047)*sailStates.q + (-0.036115)*sailStates.r + (-0.000070)*sailStates.de;

	Cl = (1.314647)*sailStates.alpha + (0.184940)*sailStates.beta + (-1.384862)*sailStates.p + (11.705122)*sailStates.q + (-0.854084)*sailStates.r + (0.000639)*sailStates.de;
	Cm = (-13.805528)*sailStates.alpha + (0.000000)*sailStates.beta + (9.230577)*sailStates.p + (-143.031982)*sailStates.q + (3.492581)*sailStates.r + (-0.070367)*sailStates.de;
	Cn = (0.170036)*sailStates.alpha + (0.019438)*sailStates.beta + (0.640364)*sailStates.p + (-2.071584)*sailStates.q + (-0.007515)*sailStates.r + (0.000054)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end