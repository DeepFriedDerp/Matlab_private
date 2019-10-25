function [aeroForces] = paramSpace_1_3_1_2_1_2_2(sailStates,airStates)

	CL = (3.772696)*sailStates.alpha + (0.162645)*sailStates.beta + (-2.504976)*sailStates.p + (34.950352)*sailStates.q + (-0.690641)*sailStates.r + (0.010505)*sailStates.de;
	CD = 0.085830;
	CY = (-0.093936)*sailStates.alpha + (-0.026932)*sailStates.beta + (-0.095166)*sailStates.p + (-0.759371)*sailStates.q + (-0.016708)*sailStates.r + (-0.000161)*sailStates.de;

	Cl = (1.093709)*sailStates.alpha + (0.115584)*sailStates.beta + (-1.136479)*sailStates.p + (9.258208)*sailStates.q + (-0.464019)*sailStates.r + (0.000262)*sailStates.de;
	Cm = (-13.572079)*sailStates.alpha + (-0.663059)*sailStates.beta + (8.479986)*sailStates.p + (-135.573257)*sailStates.q + (2.374569)*sailStates.r + (-0.067548)*sailStates.de;
	Cn = (0.211365)*sailStates.alpha + (0.018584)*sailStates.beta + (0.054485)*sailStates.p + (1.008921)*sailStates.q + (-0.037198)*sailStates.r + (0.000224)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end