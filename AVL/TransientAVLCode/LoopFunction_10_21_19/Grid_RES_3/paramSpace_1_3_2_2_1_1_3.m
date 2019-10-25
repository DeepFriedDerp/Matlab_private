function [aeroForces] = paramSpace_1_3_2_2_1_1_3(sailStates,airStates)

	CL = (4.158765)*sailStates.alpha + (0.365932)*sailStates.beta + (-2.965689)*sailStates.p + (41.391472)*sailStates.q + (-1.837987)*sailStates.r + (0.011445)*sailStates.de;
	CD = -0.370020;
	CY = (-0.166687)*sailStates.alpha + (-0.026069)*sailStates.beta + (-0.589175)*sailStates.p + (-0.491417)*sailStates.q + (-0.103887)*sailStates.r + (-0.000105)*sailStates.de;

	Cl = (1.233298)*sailStates.alpha + (0.420455)*sailStates.beta + (-1.479195)*sailStates.p + (13.161667)*sailStates.q + (-1.494066)*sailStates.r + (0.000780)*sailStates.de;
	Cm = (-12.066607)*sailStates.alpha + (-1.372809)*sailStates.beta + (9.168931)*sailStates.p + (-146.474228)*sailStates.q + (6.147785)*sailStates.r + (-0.068685)*sailStates.de;
	Cn = (0.446047)*sailStates.alpha + (0.056396)*sailStates.beta + (1.125172)*sailStates.p + (-3.847665)*sailStates.q + (-0.019056)*sailStates.r + (0.000031)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end