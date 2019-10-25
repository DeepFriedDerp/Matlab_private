function [aeroForces] = paramSpace_3_2_2_2_2_3_1(sailStates,airStates)

	CL = (4.536502)*sailStates.alpha + (0.095884)*sailStates.beta + (-2.190893)*sailStates.p + (32.909805)*sailStates.q + (1.285796)*sailStates.r + (0.011111)*sailStates.de;
	CD = -0.466890;
	CY = (-0.075344)*sailStates.alpha + (-0.024944)*sailStates.beta + (0.528709)*sailStates.p + (0.100924)*sailStates.q + (-0.034657)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.199631)*sailStates.alpha + (-0.240592)*sailStates.beta + (-0.904189)*sailStates.p + (7.258139)*sailStates.q + (1.119022)*sailStates.r + (-0.000139)*sailStates.de;
	Cm = (-14.058581)*sailStates.alpha + (-0.361966)*sailStates.beta + (7.191279)*sailStates.p + (-126.149185)*sailStates.q + (-4.350843)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.494623)*sailStates.alpha + (0.017988)*sailStates.beta + (-1.148526)*sailStates.p + (5.050936)*sailStates.q + (0.005806)*sailStates.r + (0.000064)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end