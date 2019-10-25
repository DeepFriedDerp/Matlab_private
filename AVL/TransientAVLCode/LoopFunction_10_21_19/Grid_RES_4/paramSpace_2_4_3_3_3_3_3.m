function [aeroForces] = paramSpace_2_4_3_3_3_3_3(sailStates,airStates)

	CL = (4.078835)*sailStates.alpha + (-0.071040)*sailStates.beta + (-2.785454)*sailStates.p + (36.049652)*sailStates.q + (0.161779)*sailStates.r + (0.010858)*sailStates.de;
	CD = -0.112030;
	CY = (0.085270)*sailStates.alpha + (-0.024244)*sailStates.beta + (0.149661)*sailStates.p + (0.563442)*sailStates.q + (0.009829)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.250843)*sailStates.alpha + (-0.107335)*sailStates.beta + (-1.354138)*sailStates.p + (10.882687)*sailStates.q + (0.264552)*sailStates.r + (0.000540)*sailStates.de;
	Cm = (-14.569128)*sailStates.alpha + (0.337152)*sailStates.beta + (9.648236)*sailStates.p + (-143.062881)*sailStates.q + (-0.567581)*sailStates.r + (-0.069716)*sailStates.de;
	Cn = (0.005960)*sailStates.alpha + (-0.005643)*sailStates.beta + (-0.426029)*sailStates.p + (1.745220)*sailStates.q + (-0.004837)*sailStates.r + (-0.000129)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end