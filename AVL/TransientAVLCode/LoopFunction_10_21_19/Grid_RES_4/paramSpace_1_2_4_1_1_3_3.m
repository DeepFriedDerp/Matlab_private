function [aeroForces] = paramSpace_1_2_4_1_1_3_3(sailStates,airStates)

	CL = (6.312598)*sailStates.alpha + (0.120311)*sailStates.beta + (-3.212925)*sailStates.p + (34.266293)*sailStates.q + (1.363599)*sailStates.r + (0.009643)*sailStates.de;
	CD = -2.522480;
	CY = (0.275606)*sailStates.alpha + (-0.024015)*sailStates.beta + (0.991711)*sailStates.p + (-1.002336)*sailStates.q + (0.197156)*sailStates.r + (-0.000216)*sailStates.de;

	Cl = (2.496132)*sailStates.alpha + (-0.428683)*sailStates.beta + (-1.855872)*sailStates.p + (14.658088)*sailStates.q + (1.513643)*sailStates.r + (0.001638)*sailStates.de;
	Cm = (-16.568474)*sailStates.alpha + (-0.500173)*sailStates.beta + (12.983544)*sailStates.p + (-161.102386)*sailStates.q + (-4.412291)*sailStates.r + (-0.070558)*sailStates.de;
	Cn = (-0.711384)*sailStates.alpha + (-0.097605)*sailStates.beta + (-2.553689)*sailStates.p + (13.517349)*sailStates.q + (-0.133694)*sailStates.r + (0.000496)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end