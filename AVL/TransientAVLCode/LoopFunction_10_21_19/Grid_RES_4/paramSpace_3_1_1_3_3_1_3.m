function [aeroForces] = paramSpace_3_1_1_3_3_1_3(sailStates,airStates)

	CL = (4.222759)*sailStates.alpha + (-0.128752)*sailStates.beta + (-2.795752)*sailStates.p + (35.978100)*sailStates.q + (-0.431149)*sailStates.r + (0.010891)*sailStates.de;
	CD = -0.206710;
	CY = (0.017398)*sailStates.alpha + (-0.024461)*sailStates.beta + (-0.325670)*sailStates.p + (0.432842)*sailStates.q + (0.021300)*sailStates.r + (0.000093)*sailStates.de;

	Cl = (1.503120)*sailStates.alpha + (0.116575)*sailStates.beta + (-1.458210)*sailStates.p + (12.073094)*sailStates.q + (-0.494859)*sailStates.r + (0.000822)*sailStates.de;
	Cm = (-14.856026)*sailStates.alpha + (0.597274)*sailStates.beta + (9.766082)*sailStates.p + (-143.531296)*sailStates.q + (1.489287)*sailStates.r + (-0.069765)*sailStates.de;
	Cn = (-0.084655)*sailStates.alpha + (-0.011300)*sailStates.beta + (0.785247)*sailStates.p + (-4.072929)*sailStates.q + (-0.013013)*sailStates.r + (-0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end