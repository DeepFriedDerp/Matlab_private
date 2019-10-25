function [aeroForces] = paramSpace_4_2_2_1_2_2_1(sailStates,airStates)

	CL = (3.613642)*sailStates.alpha + (0.049626)*sailStates.beta + (-1.628168)*sailStates.p + (27.993532)*sailStates.q + (0.639891)*sailStates.r + (0.010292)*sailStates.de;
	CD = 0.048720;
	CY = (0.041202)*sailStates.alpha + (-0.024295)*sailStates.beta + (0.109335)*sailStates.p + (0.662188)*sailStates.q + (-0.021772)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (0.598762)*sailStates.alpha + (-0.070133)*sailStates.beta + (-0.479442)*sailStates.p + (3.367127)*sailStates.q + (0.388395)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-12.908681)*sailStates.alpha + (-0.172878)*sailStates.beta + (5.423383)*sailStates.p + (-110.966957)*sailStates.q + (-2.153877)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (0.109270)*sailStates.alpha + (0.015457)*sailStates.beta + (-0.214168)*sailStates.p + (0.462230)*sailStates.q + (-0.015685)*sailStates.r + (-0.000177)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end