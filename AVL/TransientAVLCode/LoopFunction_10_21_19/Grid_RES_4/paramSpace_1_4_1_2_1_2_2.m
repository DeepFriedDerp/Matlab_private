function [aeroForces] = paramSpace_1_4_1_2_1_2_2(sailStates,airStates)

	CL = (3.694349)*sailStates.alpha + (0.207777)*sailStates.beta + (-2.482539)*sailStates.p + (34.961422)*sailStates.q + (-0.797908)*sailStates.r + (0.010348)*sailStates.de;
	CD = 0.101780;
	CY = (-0.093552)*sailStates.alpha + (-0.027429)*sailStates.beta + (-0.121381)*sailStates.p + (-0.756270)*sailStates.q + (-0.024063)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.062166)*sailStates.alpha + (0.139471)*sailStates.beta + (-1.120429)*sailStates.p + (9.201376)*sailStates.q + (-0.538781)*sailStates.r + (0.000250)*sailStates.de;
	Cm = (-13.229602)*sailStates.alpha + (-0.844122)*sailStates.beta + (8.353698)*sailStates.p + (-134.899979)*sailStates.q + (2.736974)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (0.216189)*sailStates.alpha + (0.024402)*sailStates.beta + (0.094503)*sailStates.p + (0.910277)*sailStates.q + (-0.044433)*sailStates.r + (0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end