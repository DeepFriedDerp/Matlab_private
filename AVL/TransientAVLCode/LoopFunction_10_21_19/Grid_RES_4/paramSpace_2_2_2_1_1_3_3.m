function [aeroForces] = paramSpace_2_2_2_1_1_3_3(sailStates,airStates)

	CL = (6.872726)*sailStates.alpha + (0.161388)*sailStates.beta + (-3.410261)*sailStates.p + (39.392513)*sailStates.q + (2.209716)*sailStates.r + (0.010948)*sailStates.de;
	CD = -2.765760;
	CY = (0.271858)*sailStates.alpha + (-0.024400)*sailStates.beta + (1.204666)*sailStates.p + (-1.471501)*sailStates.q + (0.079010)*sailStates.r + (-0.000322)*sailStates.de;

	Cl = (2.802397)*sailStates.alpha + (-0.495477)*sailStates.beta + (-1.939261)*sailStates.p + (15.963660)*sailStates.q + (2.103390)*sailStates.r + (0.001614)*sailStates.de;
	Cm = (-15.790643)*sailStates.alpha + (-0.623339)*sailStates.beta + (12.396163)*sailStates.p + (-162.286758)*sailStates.q + (-7.459561)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (-1.076324)*sailStates.alpha + (-0.037807)*sailStates.beta + (-2.781691)*sailStates.p + (14.230488)*sailStates.q + (-0.036202)*sailStates.r + (0.000704)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end