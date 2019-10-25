function [aeroForces] = paramSpace_3_1_1_2_2_2_2(sailStates,airStates)

	CL = (4.009029)*sailStates.alpha + (0.036818)*sailStates.beta + (-2.547494)*sailStates.p + (34.678192)*sailStates.q + (0.317923)*sailStates.r + (0.010918)*sailStates.de;
	CD = 0.031410;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.052749)*sailStates.p + (0.000000)*sailStates.q + (-0.003457)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.311602)*sailStates.alpha + (-0.005313)*sailStates.beta + (-1.247879)*sailStates.p + (10.315268)*sailStates.q + (0.194401)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.570069)*sailStates.alpha + (-0.046375)*sailStates.beta + (8.694923)*sailStates.p + (-136.150452)*sailStates.q + (-1.046440)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.047214)*sailStates.alpha + (0.001321)*sailStates.beta + (-0.064907)*sailStates.p + (0.173618)*sailStates.q + (-0.003406)*sailStates.r + (0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end