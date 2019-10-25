function [aeroForces] = paramSpace_1_1_2_1_2_2_3(sailStates,airStates)

	CL = (3.522554)*sailStates.alpha + (-0.199764)*sailStates.beta + (-3.345579)*sailStates.p + (42.246029)*sailStates.q + (-1.180590)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.075380;
	CY = (-0.034402)*sailStates.alpha + (-0.026316)*sailStates.beta + (-0.291020)*sailStates.p + (0.589408)*sailStates.q + (-0.051315)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.364231)*sailStates.alpha + (0.043897)*sailStates.beta + (-1.914006)*sailStates.p + (17.081533)*sailStates.q + (-0.858170)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-12.614661)*sailStates.alpha + (0.711401)*sailStates.beta + (11.059379)*sailStates.p + (-158.590912)*sailStates.q + (3.963539)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (0.486408)*sailStates.alpha + (0.018020)*sailStates.beta + (0.335632)*sailStates.p + (-0.666475)*sailStates.q + (-0.032629)*sailStates.r + (-0.000210)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end