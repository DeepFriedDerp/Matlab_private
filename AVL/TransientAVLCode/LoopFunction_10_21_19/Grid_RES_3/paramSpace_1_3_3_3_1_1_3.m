function [aeroForces] = paramSpace_1_3_3_3_1_1_3(sailStates,airStates)

	CL = (4.040557)*sailStates.alpha + (0.268707)*sailStates.beta + (-2.797244)*sailStates.p + (39.077591)*sailStates.q + (-1.485350)*sailStates.r + (0.011251)*sailStates.de;
	CD = -0.131120;
	CY = (-0.089497)*sailStates.alpha + (-0.025554)*sailStates.beta + (-0.431057)*sailStates.p + (-0.318252)*sailStates.q + (-0.076037)*sailStates.r + (-0.000068)*sailStates.de;

	Cl = (1.223619)*sailStates.alpha + (0.313002)*sailStates.beta + (-1.354407)*sailStates.p + (11.792346)*sailStates.q + (-1.143932)*sailStates.r + (0.000580)*sailStates.de;
	Cm = (-13.002728)*sailStates.alpha + (-0.935959)*sailStates.beta + (8.860651)*sailStates.p + (-142.287766)*sailStates.q + (4.946528)*sailStates.r + (-0.068238)*sailStates.de;
	Cn = (0.241826)*sailStates.alpha + (0.041407)*sailStates.beta + (0.796969)*sailStates.p + (-2.718527)*sailStates.q + (-0.019231)*sailStates.r + (-0.000001)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end