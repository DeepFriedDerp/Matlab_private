function [aeroForces] = paramSpace_1_1_1_1_1_3_2(sailStates,airStates)

	CL = (3.181056)*sailStates.alpha + (-0.046962)*sailStates.beta + (-3.755825)*sailStates.p + (43.981033)*sailStates.q + (-0.571494)*sailStates.r + (0.010896)*sailStates.de;
	CD = -0.032540;
	CY = (0.058980)*sailStates.alpha + (-0.025487)*sailStates.beta + (0.021773)*sailStates.p + (0.382272)*sailStates.q + (0.003803)*sailStates.r + (0.000083)*sailStates.de;

	Cl = (1.228036)*sailStates.alpha + (-0.049765)*sailStates.beta + (-2.244844)*sailStates.p + (19.668489)*sailStates.q + (-0.304516)*sailStates.r + (0.002170)*sailStates.de;
	Cm = (-11.720101)*sailStates.alpha + (0.185011)*sailStates.beta + (13.018944)*sailStates.p + (-171.895142)*sailStates.q + (1.994018)*sailStates.r + (-0.072292)*sailStates.de;
	Cn = (0.083280)*sailStates.alpha + (-0.008689)*sailStates.beta + (-0.443510)*sailStates.p + (3.396619)*sailStates.q + (-0.062250)*sailStates.r + (-0.000051)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end