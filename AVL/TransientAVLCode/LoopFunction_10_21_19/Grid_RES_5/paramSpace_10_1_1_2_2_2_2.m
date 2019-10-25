function [aeroForces] = paramSpace_10_1_1_2_2_2_2(sailStates,airStates)

	CL = (4.146483)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.801252)*sailStates.p + (37.376881)*sailStates.q + (0.802438)*sailStates.r + (0.011349)*sailStates.de;
	CD = -0.076860;
	CY = (0.067274)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.254898)*sailStates.p + (0.351849)*sailStates.q + (-0.017861)*sailStates.r + (0.000076)*sailStates.de;

	Cl = (1.332864)*sailStates.alpha + (-0.141667)*sailStates.beta + (-1.390817)*sailStates.p + (11.592767)*sailStates.q + (0.647411)*sailStates.r + (0.000638)*sailStates.de;
	Cm = (-14.396793)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.396872)*sailStates.p + (-143.366257)*sailStates.q + (-2.690375)*sailStates.r + (-0.070788)*sailStates.de;
	Cn = (-0.115504)*sailStates.alpha + (0.009906)*sailStates.beta + (-0.515921)*sailStates.p + (1.914366)*sailStates.q + (-0.002601)*sailStates.r + (-0.000034)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end