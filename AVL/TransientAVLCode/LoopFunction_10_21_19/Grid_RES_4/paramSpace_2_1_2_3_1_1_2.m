function [aeroForces] = paramSpace_2_1_2_3_1_1_2(sailStates,airStates)

	CL = (4.141072)*sailStates.alpha + (-0.213984)*sailStates.beta + (-2.569042)*sailStates.p + (35.464474)*sailStates.q + (-0.857737)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.141260;
	CY = (-0.062659)*sailStates.alpha + (-0.024202)*sailStates.beta + (-0.310261)*sailStates.p + (-0.498142)*sailStates.q + (-0.020318)*sailStates.r + (-0.000107)*sailStates.de;

	Cl = (1.301171)*sailStates.alpha + (0.117244)*sailStates.beta + (-1.256137)*sailStates.p + (10.514240)*sailStates.q + (-0.746287)*sailStates.r + (0.000480)*sailStates.de;
	Cm = (-14.040252)*sailStates.alpha + (0.854251)*sailStates.beta + (8.600556)*sailStates.p + (-136.384659)*sailStates.q + (2.924279)*sailStates.r + (-0.069025)*sailStates.de;
	Cn = (0.038601)*sailStates.alpha + (0.011217)*sailStates.beta + (0.635735)*sailStates.p + (-2.223575)*sailStates.q + (-0.001914)*sailStates.r + (0.000093)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end