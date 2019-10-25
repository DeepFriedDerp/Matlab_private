function [aeroForces] = paramSpace_4_2_4_2_2_2_3(sailStates,airStates)

	CL = (3.726338)*sailStates.alpha + (0.086285)*sailStates.beta + (-2.866378)*sailStates.p + (38.658161)*sailStates.q + (1.155821)*sailStates.r + (0.010698)*sailStates.de;
	CD = 0.102200;
	CY = (0.011731)*sailStates.alpha + (-0.025328)*sailStates.beta + (0.291367)*sailStates.p + (-0.301043)*sailStates.q + (-0.057989)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.337205)*sailStates.alpha + (-0.106570)*sailStates.beta + (-1.496304)*sailStates.p + (13.171397)*sailStates.q + (0.843842)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-13.122335)*sailStates.alpha + (-0.338670)*sailStates.beta + (9.406952)*sailStates.p + (-145.703583)*sailStates.q + (-3.911415)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.304361)*sailStates.alpha + (0.025241)*sailStates.beta + (-0.374868)*sailStates.p + (0.736887)*sailStates.q + (-0.034310)*sailStates.r + (0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end