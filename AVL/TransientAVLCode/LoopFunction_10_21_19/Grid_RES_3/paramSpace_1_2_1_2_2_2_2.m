function [aeroForces] = paramSpace_1_2_1_2_2_2_2(sailStates,airStates)

	CL = (3.871518)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.501877)*sailStates.p + (35.300339)*sailStates.q + (-0.891928)*sailStates.r + (0.010645)*sailStates.de;
	CD = 0.079440;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.217778)*sailStates.p + (0.000000)*sailStates.q + (-0.038400)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.215978)*sailStates.alpha + (0.108889)*sailStates.beta + (-1.174265)*sailStates.p + (9.890744)*sailStates.q + (-0.635953)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-13.709641)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.304765)*sailStates.p + (-135.529190)*sailStates.q + (3.030519)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.107285)*sailStates.alpha + (0.019200)*sailStates.beta + (0.303035)*sailStates.p + (-0.624150)*sailStates.q + (-0.022407)*sailStates.r + (-0.000010)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end