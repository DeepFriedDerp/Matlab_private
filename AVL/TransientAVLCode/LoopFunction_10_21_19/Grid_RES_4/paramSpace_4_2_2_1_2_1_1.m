function [aeroForces] = paramSpace_4_2_2_1_2_1_1(sailStates,airStates)

	CL = (5.485593)*sailStates.alpha + (-0.124940)*sailStates.beta + (-1.458158)*sailStates.p + (20.061424)*sailStates.q + (-1.612066)*sailStates.r + (0.008743)*sailStates.de;
	CD = -2.087060;
	CY = (0.418715)*sailStates.alpha + (-0.024295)*sailStates.beta + (-0.922687)*sailStates.p + (0.662189)*sailStates.q + (0.183510)*sailStates.r + (0.000138)*sailStates.de;

	Cl = (1.046403)*sailStates.alpha + (0.396342)*sailStates.beta + (-0.425670)*sailStates.p + (1.272888)*sailStates.q + (-1.700128)*sailStates.r + (-0.000734)*sailStates.de;
	Cm = (-16.489040)*sailStates.alpha + (0.494771)*sailStates.beta + (6.895930)*sailStates.p + (-110.966957)*sailStates.q + (5.249115)*sailStates.r + (-0.065509)*sailStates.de;
	Cn = (-1.982957)*sailStates.alpha + (-0.090430)*sailStates.beta + (2.133986)*sailStates.p + (-10.066223)*sailStates.q + (-0.069489)*sailStates.r + (-0.000338)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end