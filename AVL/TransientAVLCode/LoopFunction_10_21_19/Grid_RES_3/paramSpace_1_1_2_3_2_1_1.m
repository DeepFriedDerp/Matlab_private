function [aeroForces] = paramSpace_1_1_2_3_2_1_1(sailStates,airStates)

	CL = (4.154416)*sailStates.alpha + (-0.287611)*sailStates.beta + (-2.277496)*sailStates.p + (34.947102)*sailStates.q + (-1.443907)*sailStates.r + (0.010894)*sailStates.de;
	CD = -0.188630;
	CY = (0.029766)*sailStates.alpha + (-0.024394)*sailStates.beta + (-0.473609)*sailStates.p + (-0.173375)*sailStates.q + (-0.083510)*sailStates.r + (-0.000037)*sailStates.de;

	Cl = (1.224141)*sailStates.alpha + (0.159791)*sailStates.beta + (-1.015804)*sailStates.p + (8.919454)*sailStates.q + (-1.146873)*sailStates.r + (0.000114)*sailStates.de;
	Cm = (-12.878827)*sailStates.alpha + (1.072407)*sailStates.beta + (7.051843)*sailStates.p + (-127.559647)*sailStates.q + (4.827813)*sailStates.r + (-0.066767)*sailStates.de;
	Cn = (-0.175159)*sailStates.alpha + (0.042890)*sailStates.beta + (0.933758)*sailStates.p + (-3.570212)*sailStates.q + (-0.005995)*sailStates.r + (-0.000023)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end