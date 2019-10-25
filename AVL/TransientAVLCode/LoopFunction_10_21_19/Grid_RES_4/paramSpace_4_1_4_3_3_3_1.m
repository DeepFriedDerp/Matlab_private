function [aeroForces] = paramSpace_4_1_4_3_3_3_1(sailStates,airStates)

	CL = (3.938972)*sailStates.alpha + (0.357040)*sailStates.beta + (-2.273998)*sailStates.p + (35.197380)*sailStates.q + (1.426118)*sailStates.r + (0.010684)*sailStates.de;
	CD = -0.116790;
	CY = (0.040625)*sailStates.alpha + (-0.022395)*sailStates.beta + (0.435747)*sailStates.p + (0.684400)*sailStates.q + (-0.086602)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.116578)*sailStates.alpha + (-0.151739)*sailStates.beta + (-1.019947)*sailStates.p + (9.036447)*sailStates.q + (1.144078)*sailStates.r + (0.000159)*sailStates.de;
	Cm = (-12.137469)*sailStates.alpha + (-1.414402)*sailStates.beta + (7.021214)*sailStates.p + (-127.495163)*sailStates.q + (-4.792056)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (0.058620)*sailStates.alpha + (0.045729)*sailStates.beta + (-0.830843)*sailStates.p + (2.500907)*sailStates.q + (-0.022357)*sailStates.r + (-0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end