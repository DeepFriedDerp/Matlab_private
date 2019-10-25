function [aeroForces] = paramSpace_1_3_1_3_2_1_1(sailStates,airStates)

	CL = (4.116345)*sailStates.alpha + (0.125741)*sailStates.beta + (-2.278427)*sailStates.p + (35.547066)*sailStates.q + (-1.559009)*sailStates.r + (0.010844)*sailStates.de;
	CD = -0.172600;
	CY = (0.031694)*sailStates.alpha + (-0.025204)*sailStates.beta + (-0.515383)*sailStates.p + (-0.194783)*sailStates.q + (-0.102495)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.142948)*sailStates.alpha + (0.297629)*sailStates.beta + (-0.956858)*sailStates.p + (8.344960)*sailStates.q + (-1.239763)*sailStates.r + (-0.000040)*sailStates.de;
	Cm = (-12.396939)*sailStates.alpha + (-0.494217)*sailStates.beta + (6.915706)*sailStates.p + (-127.822792)*sailStates.q + (5.222235)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (-0.232826)*sailStates.alpha + (0.052638)*sailStates.beta + (1.010072)*sailStates.p + (-3.777878)*sailStates.q + (-0.008158)*sailStates.r + (-0.000007)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end