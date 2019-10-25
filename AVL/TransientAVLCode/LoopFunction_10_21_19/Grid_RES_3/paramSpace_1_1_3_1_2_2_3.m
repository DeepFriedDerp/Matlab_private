function [aeroForces] = paramSpace_1_1_3_1_2_2_3(sailStates,airStates)

	CL = (3.564273)*sailStates.alpha + (-0.174375)*sailStates.beta + (-3.346734)*sailStates.p + (42.187550)*sailStates.q + (-1.167340)*sailStates.r + (0.011164)*sailStates.de;
	CD = 0.067030;
	CY = (-0.027001)*sailStates.alpha + (-0.026170)*sailStates.beta + (-0.271391)*sailStates.p + (0.589407)*sailStates.q + (-0.047797)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.367563)*sailStates.alpha + (0.036394)*sailStates.beta + (-1.914540)*sailStates.p + (17.078943)*sailStates.q + (-0.825759)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-12.851800)*sailStates.alpha + (0.550928)*sailStates.beta + (11.072904)*sailStates.p + (-158.590912)*sailStates.q + (3.886840)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (0.461340)*sailStates.alpha + (0.016369)*sailStates.beta + (0.306208)*sailStates.p + (-0.651791)*sailStates.q + (-0.032409)*sailStates.r + (-0.000231)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end