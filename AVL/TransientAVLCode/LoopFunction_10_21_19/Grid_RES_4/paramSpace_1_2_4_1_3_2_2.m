function [aeroForces] = paramSpace_1_2_4_1_3_2_2(sailStates,airStates)

	CL = (4.240949)*sailStates.alpha + (-0.078094)*sailStates.beta + (-2.432093)*sailStates.p + (35.483452)*sailStates.q + (-1.399823)*sailStates.r + (0.010758)*sailStates.de;
	CD = -0.044550;
	CY = (0.221495)*sailStates.alpha + (-0.026573)*sailStates.beta + (-0.464559)*sailStates.p + (1.664520)*sailStates.q + (-0.092228)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (1.485153)*sailStates.alpha + (0.135524)*sailStates.beta + (-1.148822)*sailStates.p + (10.188682)*sailStates.q + (-0.995008)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-14.230812)*sailStates.alpha + (0.246458)*sailStates.beta + (7.615855)*sailStates.p + (-132.472137)*sailStates.q + (4.618074)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.167234)*sailStates.alpha + (0.034159)*sailStates.beta + (0.830791)*sailStates.p + (-4.411860)*sailStates.q + (0.012228)*sailStates.r + (-0.000550)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end