function [aeroForces] = paramSpace_1_3_2_1_2_3_3(sailStates,airStates)

	CL = (5.435516)*sailStates.alpha + (-0.264202)*sailStates.beta + (-3.193654)*sailStates.p + (35.185726)*sailStates.q + (1.064459)*sailStates.r + (0.009641)*sailStates.de;
	CD = -1.960690;
	CY = (0.344660)*sailStates.alpha + (-0.023346)*sailStates.beta + (0.745234)*sailStates.p + (0.589407)*sailStates.q + (0.131405)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.722092)*sailStates.alpha + (-0.449022)*sailStates.beta + (-1.781311)*sailStates.p + (14.156598)*sailStates.q + (1.243049)*sailStates.r + (0.001364)*sailStates.de;
	Cm = (-14.826854)*sailStates.alpha + (1.072840)*sailStates.beta + (12.370081)*sailStates.p + (-158.590927)*sailStates.q + (-3.469814)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (-0.639442)*sailStates.alpha + (-0.058482)*sailStates.beta + (-1.999827)*sailStates.p + (9.718096)*sailStates.q + (-0.078057)*sailStates.r + (0.000021)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end