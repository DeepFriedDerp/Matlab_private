function [aeroForces] = paramSpace_4_1_3_2_3_3_2(sailStates,airStates)

	CL = (4.193225)*sailStates.alpha + (0.425129)*sailStates.beta + (-2.560421)*sailStates.p + (38.515472)*sailStates.q + (1.812349)*sailStates.r + (0.011143)*sailStates.de;
	CD = -0.364210;
	CY = (0.101303)*sailStates.alpha + (-0.022301)*sailStates.beta + (0.575694)*sailStates.p + (0.756271)*sailStates.q + (-0.114486)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.224367)*sailStates.alpha + (-0.195599)*sailStates.beta + (-1.239556)*sailStates.p + (11.338139)*sailStates.q + (1.482833)*sailStates.r + (0.000505)*sailStates.de;
	Cm = (-11.782476)*sailStates.alpha + (-1.619695)*sailStates.beta + (7.694674)*sailStates.p + (-134.899979)*sailStates.q + (-6.050108)*sailStates.r + (-0.066768)*sailStates.de;
	Cn = (-0.153808)*sailStates.alpha + (0.060335)*sailStates.beta + (-1.120429)*sailStates.p + (3.623783)*sailStates.q + (-0.023125)*sailStates.r + (-0.000122)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end