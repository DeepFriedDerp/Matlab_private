function [aeroForces] = paramSpace_3_3_1_3_1_3_2(sailStates,airStates)

	CL = (4.409625)*sailStates.alpha + (-0.069234)*sailStates.beta + (-2.579045)*sailStates.p + (35.752522)*sailStates.q + (1.102972)*sailStates.r + (0.011243)*sailStates.de;
	CD = -0.232330;
	CY = (-0.063700)*sailStates.alpha + (-0.024851)*sailStates.beta + (0.442027)*sailStates.p + (-0.498142)*sailStates.q + (-0.028919)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.390406)*sailStates.alpha + (-0.224565)*sailStates.beta + (-1.194162)*sailStates.p + (9.798394)*sailStates.q + (0.908489)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-14.633228)*sailStates.alpha + (0.235665)*sailStates.beta + (8.559443)*sailStates.p + (-136.960373)*sailStates.q + (-3.700703)*sailStates.r + (-0.070040)*sailStates.de;
	Cn = (0.169015)*sailStates.alpha + (0.012799)*sailStates.beta + (-0.927420)*sailStates.p + (4.492136)*sailStates.q + (0.006040)*sailStates.r + (0.000238)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end