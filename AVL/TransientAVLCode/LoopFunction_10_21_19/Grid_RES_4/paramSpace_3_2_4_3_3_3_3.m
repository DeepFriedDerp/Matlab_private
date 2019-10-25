function [aeroForces] = paramSpace_3_2_4_3_3_3_3(sailStates,airStates)

	CL = (4.152772)*sailStates.alpha + (0.080552)*sailStates.beta + (-2.848528)*sailStates.p + (37.855778)*sailStates.q + (0.903821)*sailStates.r + (0.011282)*sailStates.de;
	CD = -0.139080;
	CY = (0.091255)*sailStates.alpha + (-0.024776)*sailStates.beta + (0.336531)*sailStates.p + (0.432842)*sailStates.q + (-0.022012)*sailStates.r + (0.000094)*sailStates.de;

	Cl = (1.356735)*sailStates.alpha + (-0.165313)*sailStates.beta + (-1.445258)*sailStates.p + (12.159828)*sailStates.q + (0.798181)*sailStates.r + (0.000744)*sailStates.de;
	Cm = (-14.061496)*sailStates.alpha + (-0.337853)*sailStates.beta + (9.532357)*sailStates.p + (-144.575424)*sailStates.q + (-3.101994)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (-0.174922)*sailStates.alpha + (0.012042)*sailStates.beta + (-0.668741)*sailStates.p + (2.280649)*sailStates.q + (-0.002649)*sailStates.r + (-0.000083)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end