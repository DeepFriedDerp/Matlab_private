function [aeroForces] = paramSpace_1_2_4_3_2_3_3(sailStates,airStates)

	CL = (3.978279)*sailStates.alpha + (-0.011663)*sailStates.beta + (-2.682095)*sailStates.p + (35.016460)*sailStates.q + (-0.412581)*sailStates.r + (0.010431)*sailStates.de;
	CD = -0.080070;
	CY = (0.031715)*sailStates.alpha + (-0.025163)*sailStates.beta + (0.072212)*sailStates.p + (0.194782)*sailStates.q + (0.014385)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.322257)*sailStates.alpha + (-0.053584)*sailStates.beta + (-1.369414)*sailStates.p + (11.468699)*sailStates.q + (-0.114103)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-14.715597)*sailStates.alpha + (0.000257)*sailStates.beta + (9.428791)*sailStates.p + (-141.871536)*sailStates.q + (1.398440)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (0.192816)*sailStates.alpha + (-0.010865)*sailStates.beta + (-0.393361)*sailStates.p + (2.415977)*sailStates.q + (-0.047117)*sailStates.r + (-0.000043)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end