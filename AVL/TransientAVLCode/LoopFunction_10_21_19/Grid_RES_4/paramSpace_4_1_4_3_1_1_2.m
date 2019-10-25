function [aeroForces] = paramSpace_4_1_4_3_1_1_2(sailStates,airStates)

	CL = (3.798393)*sailStates.alpha + (0.098301)*sailStates.beta + (-2.395904)*sailStates.p + (32.837276)*sailStates.q + (0.455291)*sailStates.r + (0.009884)*sailStates.de;
	CD = -0.002330;
	CY = (-0.059449)*sailStates.alpha + (-0.026497)*sailStates.beta + (0.016256)*sailStates.p + (-0.489619)*sailStates.q + (-0.003286)*sailStates.r + (-0.000103)*sailStates.de;

	Cl = (1.250179)*sailStates.alpha + (0.042570)*sailStates.beta + (-1.176115)*sailStates.p + (9.839206)*sailStates.q + (0.206145)*sailStates.r + (0.000422)*sailStates.de;
	Cm = (-13.979252)*sailStates.alpha + (-0.403342)*sailStates.beta + (8.359670)*sailStates.p + (-133.122253)*sailStates.q + (-1.592121)*sailStates.r + (-0.066591)*sailStates.de;
	Cn = (-0.165231)*sailStates.alpha + (-0.006500)*sailStates.beta + (0.196212)*sailStates.p + (-1.403456)*sailStates.q + (-0.033660)*sailStates.r + (0.000103)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end