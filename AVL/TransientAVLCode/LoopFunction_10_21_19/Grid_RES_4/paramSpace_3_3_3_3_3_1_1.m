function [aeroForces] = paramSpace_3_3_3_3_3_1_1(sailStates,airStates)

	CL = (4.262754)*sailStates.alpha + (0.031581)*sailStates.beta + (-2.294304)*sailStates.p + (32.060467)*sailStates.q + (-0.479094)*sailStates.r + (0.010747)*sailStates.de;
	CD = -0.193430;
	CY = (0.103094)*sailStates.alpha + (-0.025197)*sailStates.beta + (-0.316358)*sailStates.p + (0.563443)*sailStates.q + (0.020755)*sailStates.r + (0.000121)*sailStates.de;

	Cl = (1.193476)*sailStates.alpha + (0.146239)*sailStates.beta + (-0.976808)*sailStates.p + (7.397484)*sailStates.q + (-0.505204)*sailStates.r + (-0.000030)*sailStates.de;
	Cm = (-15.068295)*sailStates.alpha + (-0.118074)*sailStates.beta + (8.088456)*sailStates.p + (-130.282166)*sailStates.q + (1.606061)*sailStates.r + (-0.069379)*sailStates.de;
	Cn = (-0.387427)*sailStates.alpha + (-0.008152)*sailStates.beta + (0.751561)*sailStates.p + (-4.030161)*sailStates.q + (-0.012000)*sailStates.r + (-0.000227)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end