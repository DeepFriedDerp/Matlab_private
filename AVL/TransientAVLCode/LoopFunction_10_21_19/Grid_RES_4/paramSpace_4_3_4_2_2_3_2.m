function [aeroForces] = paramSpace_4_3_4_2_2_3_2(sailStates,airStates)

	CL = (4.475241)*sailStates.alpha + (-0.158528)*sailStates.beta + (-2.556273)*sailStates.p + (38.957336)*sailStates.q + (2.021955)*sailStates.r + (0.011217)*sailStates.de;
	CD = -0.483330;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.712066)*sailStates.p + (0.000001)*sailStates.q + (-0.141639)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.373923)*sailStates.alpha + (-0.399371)*sailStates.beta + (-1.171223)*sailStates.p + (10.662755)*sailStates.q + (1.657865)*sailStates.r + (0.000289)*sailStates.de;
	Cm = (-12.005594)*sailStates.alpha + (0.617284)*sailStates.beta + (7.488170)*sailStates.p + (-134.847153)*sailStates.q + (-6.749424)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (0.046058)*sailStates.alpha + (0.070221)*sailStates.beta + (-1.410752)*sailStates.p + (5.518562)*sailStates.q + (-0.003130)*sailStates.r + (0.000100)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end