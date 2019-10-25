function [aeroForces] = paramSpace_3_2_2_3_3_1_2(sailStates,airStates)

	CL = (4.304847)*sailStates.alpha + (-0.037195)*sailStates.beta + (-2.554770)*sailStates.p + (34.152332)*sailStates.q + (-0.453472)*sailStates.r + (0.010900)*sailStates.de;
	CD = -0.203470;
	CY = (0.060961)*sailStates.alpha + (-0.024816)*sailStates.beta + (-0.320742)*sailStates.p + (0.498141)*sailStates.q + (0.021005)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.384774)*sailStates.alpha + (0.130192)*sailStates.beta + (-1.222158)*sailStates.p + (9.773292)*sailStates.q + (-0.499026)*sailStates.r + (0.000399)*sailStates.de;
	Cm = (-15.168687)*sailStates.alpha + (0.158539)*sailStates.beta + (8.960443)*sailStates.p + (-137.428818)*sailStates.q + (1.541087)*sailStates.r + (-0.070088)*sailStates.de;
	Cn = (-0.240524)*sailStates.alpha + (-0.009846)*sailStates.beta + (0.768052)*sailStates.p + (-4.050838)*sailStates.q + (-0.012398)*sailStates.r + (-0.000201)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end