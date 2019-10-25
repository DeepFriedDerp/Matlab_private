function [aeroForces] = paramSpace_4_1_2_2_2_2_3(sailStates,airStates)

	CL = (3.753466)*sailStates.alpha + (0.215292)*sailStates.beta + (-2.849120)*sailStates.p + (38.291916)*sailStates.q + (1.130262)*sailStates.r + (0.010713)*sailStates.de;
	CD = 0.070690;
	CY = (0.006706)*sailStates.alpha + (-0.025713)*sailStates.beta + (0.260607)*sailStates.p + (-0.301044)*sailStates.q + (-0.051827)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.362249)*sailStates.alpha + (-0.038108)*sailStates.beta + (-1.519649)*sailStates.p + (13.487051)*sailStates.q + (0.797341)*sailStates.r + (0.000968)*sailStates.de;
	Cm = (-13.317308)*sailStates.alpha + (-0.740875)*sailStates.beta + (9.365703)*sailStates.p + (-144.677322)*sailStates.q + (-3.780923)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.302355)*sailStates.alpha + (0.019327)*sailStates.beta + (-0.322391)*sailStates.p + (0.630892)*sailStates.q + (-0.034399)*sailStates.r + (0.000125)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end