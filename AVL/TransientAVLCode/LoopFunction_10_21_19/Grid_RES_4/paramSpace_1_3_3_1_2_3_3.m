function [aeroForces] = paramSpace_1_3_3_1_2_3_3(sailStates,airStates)

	CL = (5.415325)*sailStates.alpha + (-0.093568)*sailStates.beta + (-3.162838)*sailStates.p + (34.589928)*sailStates.q + (0.927563)*sailStates.r + (0.009539)*sailStates.de;
	CD = -1.928170;
	CY = (0.341812)*sailStates.alpha + (-0.024295)*sailStates.beta + (0.712454)*sailStates.p + (0.662186)*sailStates.q + (0.141740)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (1.741733)*sailStates.alpha + (-0.399598)*sailStates.beta + (-1.793305)*sailStates.p + (14.350026)*sailStates.q + (1.145726)*sailStates.r + (0.001434)*sailStates.de;
	Cm = (-15.162042)*sailStates.alpha + (0.389693)*sailStates.beta + (12.401902)*sailStates.p + (-158.727356)*sailStates.q + (-2.977617)*sailStates.r + (-0.070277)*sailStates.de;
	Cn = (-0.604867)*sailStates.alpha + (-0.071252)*sailStates.beta + (-1.967205)*sailStates.p + (9.640141)*sailStates.q + (-0.092554)*sailStates.r + (-0.000013)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end