function [aeroForces] = paramSpace_3_1_2_3_1_1_3(sailStates,airStates)

	CL = (4.078835)*sailStates.alpha + (-0.071040)*sailStates.beta + (-2.785454)*sailStates.p + (36.049652)*sailStates.q + (-0.161779)*sailStates.r + (0.010858)*sailStates.de;
	CD = -0.112030;
	CY = (-0.085270)*sailStates.alpha + (-0.025328)*sailStates.beta + (-0.149661)*sailStates.p + (-0.563442)*sailStates.q + (0.009829)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.391837)*sailStates.alpha + (0.087366)*sailStates.beta + (-1.451836)*sailStates.p + (12.091246)*sailStates.q + (-0.258191)*sailStates.r + (0.000800)*sailStates.de;
	Cm = (-14.569128)*sailStates.alpha + (0.337152)*sailStates.beta + (9.648237)*sailStates.p + (-143.062866)*sailStates.q + (0.567581)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.010388)*sailStates.alpha + (-0.007118)*sailStates.beta + (0.432432)*sailStates.p + (-1.824433)*sailStates.q + (-0.005254)*sailStates.r + (0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end