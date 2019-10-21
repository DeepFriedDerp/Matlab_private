function [aeroForces] = paramSpace_1_1_1_1_3_3_1(sailStates,airStates)

	CL = (-0.746333)*sailStates.alpha + (0.195241)*sailStates.beta + (-7.118468)*sailStates.p + (64.296883)*sailStates.q + (1.137320)*sailStates.r + (0.011401)*sailStates.de;
	CD = -5.439670;
	CY = (2.485063)*sailStates.alpha + (-0.030308)*sailStates.beta + (0.969630)*sailStates.p + (3.860882)*sailStates.q + (0.170605)*sailStates.r + (0.000895)*sailStates.de;

	Cl = (-3.758371)*sailStates.alpha + (-0.631031)*sailStates.beta + (-5.118684)*sailStates.p + (45.271629)*sailStates.q + (1.456629)*sailStates.r + (0.007439)*sailStates.de;
	Cm = (20.374483)*sailStates.alpha + (-0.788368)*sailStates.beta + (26.362925)*sailStates.p + (-271.323669)*sailStates.q + (-3.629427)*sailStates.r + (-0.088458)*sailStates.de;
	Cn = (-10.458315)*sailStates.alpha + (-0.122576)*sailStates.beta + (-3.218837)*sailStates.p + (15.815619)*sailStates.q + (-0.151145)*sailStates.r + (-0.000597)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end