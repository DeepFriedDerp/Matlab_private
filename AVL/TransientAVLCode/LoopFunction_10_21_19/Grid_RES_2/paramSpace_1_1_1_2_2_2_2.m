function [aeroForces] = paramSpace_1_1_1_2_2_2_2(sailStates,airStates)

	CL = (3.956061)*sailStates.alpha + (-0.037332)*sailStates.beta + (-2.701320)*sailStates.p + (35.525455)*sailStates.q + (-0.292085)*sailStates.r + (0.010611)*sailStates.de;
	CD = -0.011840;
	CY = (0.063751)*sailStates.alpha + (-0.025707)*sailStates.beta + (0.005246)*sailStates.p + (0.513810)*sailStates.q + (0.000654)*sailStates.r + (0.000110)*sailStates.de;

	Cl = (1.351067)*sailStates.alpha + (-0.037565)*sailStates.beta + (-1.378433)*sailStates.p + (11.507256)*sailStates.q + (-0.110768)*sailStates.r + (0.000685)*sailStates.de;
	Cm = (-14.427291)*sailStates.alpha + (0.148613)*sailStates.beta + (9.345471)*sailStates.p + (-141.379639)*sailStates.q + (1.012794)*sailStates.r + (-0.069332)*sailStates.de;
	Cn = (0.100182)*sailStates.alpha + (-0.004463)*sailStates.beta + (-0.198936)*sailStates.p + (1.207885)*sailStates.q + (-0.016932)*sailStates.r + (-0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end