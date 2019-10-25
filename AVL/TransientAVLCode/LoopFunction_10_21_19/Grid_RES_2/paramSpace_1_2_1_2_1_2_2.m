function [aeroForces] = paramSpace_1_2_1_2_1_2_2(sailStates,airStates)

	CL = (4.002651)*sailStates.alpha + (0.017795)*sailStates.beta + (-2.717545)*sailStates.p + (35.435841)*sailStates.q + (-0.081301)*sailStates.r + (0.010614)*sailStates.de;
	CD = -0.061830;
	CY = (-0.024083)*sailStates.alpha + (-0.025373)*sailStates.beta + (0.135867)*sailStates.p + (-0.299436)*sailStates.q + (0.017908)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.291845)*sailStates.alpha + (-0.051734)*sailStates.beta + (-1.324143)*sailStates.p + (10.677109)*sailStates.q + (0.070285)*sailStates.r + (0.000548)*sailStates.de;
	Cm = (-14.549489)*sailStates.alpha + (-0.082837)*sailStates.beta + (9.531754)*sailStates.p + (-142.147675)*sailStates.q + (0.317711)*sailStates.r + (-0.069412)*sailStates.de;
	Cn = (0.192021)*sailStates.alpha + (-0.004338)*sailStates.beta + (-0.461432)*sailStates.p + (2.937426)*sailStates.q + (-0.028681)*sailStates.r + (0.000137)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end