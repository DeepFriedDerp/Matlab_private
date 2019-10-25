function [aeroForces] = paramSpace_4_3_1_1_1_2_2(sailStates,airStates)

	CL = (4.240949)*sailStates.alpha + (-0.078094)*sailStates.beta + (-2.432093)*sailStates.p + (35.483452)*sailStates.q + (1.399823)*sailStates.r + (0.010758)*sailStates.de;
	CD = -0.044550;
	CY = (-0.221495)*sailStates.alpha + (-0.023379)*sailStates.beta + (0.464559)*sailStates.p + (-1.664520)*sailStates.q + (-0.092228)*sailStates.r + (-0.000352)*sailStates.de;

	Cl = (1.438095)*sailStates.alpha + (-0.196052)*sailStates.beta + (-1.117273)*sailStates.p + (9.791713)*sailStates.q + (0.988775)*sailStates.r + (0.000178)*sailStates.de;
	Cm = (-14.230812)*sailStates.alpha + (0.246458)*sailStates.beta + (7.615855)*sailStates.p + (-132.472137)*sailStates.q + (-4.618074)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (0.191662)*sailStates.alpha + (0.031795)*sailStates.beta + (-0.837067)*sailStates.p + (4.490822)*sailStates.q + (0.013468)*sailStates.r + (0.000550)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end