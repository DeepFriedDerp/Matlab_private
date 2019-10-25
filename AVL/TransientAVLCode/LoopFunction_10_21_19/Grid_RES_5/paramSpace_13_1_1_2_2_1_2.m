function [aeroForces] = paramSpace_13_1_1_2_2_1_2(sailStates,airStates)

	CL = (4.021954)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.685721)*sailStates.p + (35.163803)*sailStates.q + (0.294847)*sailStates.r + (0.010635)*sailStates.de;
	CD = -0.067960;
	CY = (0.021127)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.115751)*sailStates.p + (0.261303)*sailStates.q + (0.020382)*sailStates.r + (0.000056)*sailStates.de;

	Cl = (1.317235)*sailStates.alpha + (0.047450)*sailStates.beta + (-1.340759)*sailStates.p + (11.044180)*sailStates.q + (0.039979)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-14.834636)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.447047)*sailStates.p + (-141.841248)*sailStates.q + (-0.999568)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (-0.224061)*sailStates.alpha + (-0.008367)*sailStates.beta + (0.444928)*sailStates.p + (-2.840708)*sailStates.q + (-0.044094)*sailStates.r + (-0.000091)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end