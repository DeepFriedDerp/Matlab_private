function [aeroForces] = paramSpace_3_4_1_1_3_2_1(sailStates,airStates)

	CL = (3.818427)*sailStates.alpha + (0.039834)*sailStates.beta + (-1.679716)*sailStates.p + (27.417233)*sailStates.q + (-0.238509)*sailStates.r + (0.010529)*sailStates.de;
	CD = -0.018540;
	CY = (0.327967)*sailStates.alpha + (-0.026223)*sailStates.beta + (-0.256603)*sailStates.p + (1.915493)*sailStates.q + (0.016616)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (0.596230)*sailStates.alpha + (0.068592)*sailStates.beta + (-0.438033)*sailStates.p + (2.370697)*sailStates.q + (-0.266899)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-14.037133)*sailStates.alpha + (-0.213387)*sailStates.beta + (5.935087)*sailStates.p + (-112.650780)*sailStates.q + (0.806395)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-0.599630)*sailStates.alpha + (-0.001486)*sailStates.beta + (0.516685)*sailStates.p + (-3.609232)*sailStates.q + (-0.014460)*sailStates.r + (-0.000572)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end