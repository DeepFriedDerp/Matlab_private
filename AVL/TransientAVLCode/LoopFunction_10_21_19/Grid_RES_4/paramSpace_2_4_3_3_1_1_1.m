function [aeroForces] = paramSpace_2_4_3_3_1_1_1(sailStates,airStates)

	CL = (4.127658)*sailStates.alpha + (0.187826)*sailStates.beta + (-2.309042)*sailStates.p + (33.339645)*sailStates.q + (-0.815068)*sailStates.r + (0.010923)*sailStates.de;
	CD = -0.136370;
	CY = (-0.040049)*sailStates.alpha + (-0.025328)*sailStates.beta + (-0.284876)*sailStates.p + (-0.563442)*sailStates.q + (-0.018692)*sailStates.r + (-0.000120)*sailStates.de;

	Cl = (1.017490)*sailStates.alpha + (0.215310)*sailStates.beta + (-0.945973)*sailStates.p + (7.332236)*sailStates.q + (-0.688318)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-14.050401)*sailStates.alpha + (-0.702429)*sailStates.beta + (7.735023)*sailStates.p + (-129.238022)*sailStates.q + (2.760893)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (-0.155233)*sailStates.alpha + (0.010653)*sailStates.beta + (0.612514)*sailStates.p + (-2.273865)*sailStates.q + (-0.000897)*sailStates.r + (0.000107)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end