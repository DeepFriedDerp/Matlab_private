function [aeroForces] = paramSpace_2_2_2_3_1_3_1(sailStates,airStates)

	CL = (4.262754)*sailStates.alpha + (0.031581)*sailStates.beta + (-2.294304)*sailStates.p + (32.060467)*sailStates.q + (0.479094)*sailStates.r + (0.010747)*sailStates.de;
	CD = -0.193430;
	CY = (-0.103094)*sailStates.alpha + (-0.024755)*sailStates.beta + (0.316358)*sailStates.p + (-0.563443)*sailStates.q + (0.020755)*sailStates.r + (-0.000121)*sailStates.de;

	Cl = (1.247946)*sailStates.alpha + (-0.124474)*sailStates.beta + (-1.009456)*sailStates.p + (7.801363)*sailStates.q + (0.503049)*sailStates.r + (0.000057)*sailStates.de;
	Cm = (-15.068295)*sailStates.alpha + (-0.118075)*sailStates.beta + (8.088456)*sailStates.p + (-130.282166)*sailStates.q + (-1.606061)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (0.379134)*sailStates.alpha + (-0.009592)*sailStates.beta + (-0.753701)*sailStates.p + (4.056633)*sailStates.q + (-0.012141)*sailStates.r + (0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end