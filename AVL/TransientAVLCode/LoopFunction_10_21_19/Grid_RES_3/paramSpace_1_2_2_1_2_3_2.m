function [aeroForces] = paramSpace_1_2_2_1_2_3_2(sailStates,airStates)

	CL = (5.835211)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.350789)*sailStates.p + (28.182066)*sailStates.q + (1.364453)*sailStates.r + (0.009345)*sailStates.de;
	CD = -2.031310;
	CY = (-0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.837937)*sailStates.p + (-0.000000)*sailStates.q + (0.147751)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.678535)*sailStates.alpha + (-0.418969)*sailStates.beta + (-1.126619)*sailStates.p + (8.024025)*sailStates.q + (1.481810)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-16.660732)*sailStates.alpha + (0.000000)*sailStates.beta + (9.627064)*sailStates.p + (-135.529190)*sailStates.q + (-4.468612)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (0.591054)*sailStates.alpha + (-0.073876)*sailStates.beta + (-2.076577)*sailStates.p + (9.962538)*sailStates.q + (-0.069845)*sailStates.r + (0.000175)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end