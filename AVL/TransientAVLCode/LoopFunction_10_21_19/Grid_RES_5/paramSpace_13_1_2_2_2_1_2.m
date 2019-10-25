function [aeroForces] = paramSpace_13_1_2_2_2_1_2(sailStates,airStates)

	CL = (3.985340)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.685015)*sailStates.p + (35.207474)*sailStates.q + (0.303824)*sailStates.r + (0.010555)*sailStates.de;
	CD = -0.056920;
	CY = (0.022464)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.101090)*sailStates.p + (0.261303)*sailStates.q + (0.017816)*sailStates.r + (0.000056)*sailStates.de;

	Cl = (1.313822)*sailStates.alpha + (0.040121)*sailStates.beta + (-1.340417)*sailStates.p + (11.046162)*sailStates.q + (0.063849)*sailStates.r + (0.000636)*sailStates.de;
	Cm = (-14.651482)*sailStates.alpha + (0.000000)*sailStates.beta + (9.437952)*sailStates.p + (-141.841248)*sailStates.q + (-1.051146)*sailStates.r + (-0.069021)*sailStates.de;
	Cn = (-0.229061)*sailStates.alpha + (-0.007074)*sailStates.beta + (0.422978)*sailStates.p + (-2.829471)*sailStates.q + (-0.044195)*sailStates.r + (-0.000102)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end