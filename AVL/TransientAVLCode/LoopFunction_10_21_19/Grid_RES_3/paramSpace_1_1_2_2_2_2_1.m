function [aeroForces] = paramSpace_1_1_2_2_2_2_1(sailStates,airStates)

	CL = (3.820689)*sailStates.alpha + (-0.145366)*sailStates.beta + (-2.094913)*sailStates.p + (31.711720)*sailStates.q + (-0.735551)*sailStates.r + (0.010422)*sailStates.de;
	CD = 0.052930;
	CY = (-0.007110)*sailStates.alpha + (-0.024156)*sailStates.beta + (-0.154220)*sailStates.p + (-0.267956)*sailStates.q + (-0.027193)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (1.046281)*sailStates.alpha + (0.047269)*sailStates.beta + (-0.888568)*sailStates.p + (7.292133)*sailStates.q + (-0.494063)*sailStates.r + (-0.000066)*sailStates.de;
	Cm = (-13.607532)*sailStates.alpha + (0.528259)*sailStates.beta + (6.987535)*sailStates.p + (-123.711861)*sailStates.q + (2.481508)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (0.011466)*sailStates.alpha + (0.013376)*sailStates.beta + (0.232150)*sailStates.p + (-0.440968)*sailStates.q + (-0.018556)*sailStates.r + (0.000061)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end