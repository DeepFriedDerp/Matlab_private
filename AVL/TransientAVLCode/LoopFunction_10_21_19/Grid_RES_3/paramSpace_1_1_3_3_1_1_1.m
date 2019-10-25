function [aeroForces] = paramSpace_1_1_3_3_1_1_1(sailStates,airStates)

	CL = (4.073677)*sailStates.alpha + (-0.246994)*sailStates.beta + (-2.291257)*sailStates.p + (34.817669)*sailStates.q + (-1.306428)*sailStates.r + (0.010999)*sailStates.de;
	CD = -0.131840;
	CY = (-0.044664)*sailStates.alpha + (-0.023320)*sailStates.beta + (-0.375906)*sailStates.p + (-0.665002)*sailStates.q + (-0.066346)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.133277)*sailStates.alpha + (0.138620)*sailStates.beta + (-1.024277)*sailStates.p + (8.894006)*sailStates.q + (-1.012108)*sailStates.r + (0.000143)*sailStates.de;
	Cm = (-13.057067)*sailStates.alpha + (0.863533)*sailStates.beta + (7.212672)*sailStates.p + (-128.181442)*sailStates.q + (4.353829)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (-0.062426)*sailStates.alpha + (0.036241)*sailStates.beta + (0.740463)*sailStates.p + (-2.440106)*sailStates.q + (-0.016160)*sailStates.r + (0.000117)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end