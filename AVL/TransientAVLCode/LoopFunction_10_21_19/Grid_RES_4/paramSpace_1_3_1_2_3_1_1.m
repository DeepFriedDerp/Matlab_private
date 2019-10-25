function [aeroForces] = paramSpace_1_3_1_2_3_1_1(sailStates,airStates)

	CL = (4.720368)*sailStates.alpha + (0.160269)*sailStates.beta + (-2.146699)*sailStates.p + (35.778702)*sailStates.q + (-2.058685)*sailStates.r + (0.011028)*sailStates.de;
	CD = -0.624290;
	CY = (0.198915)*sailStates.alpha + (-0.024445)*sailStates.beta + (-0.784223)*sailStates.p + (0.455227)*sailStates.q + (-0.156041)*sailStates.r + (0.000096)*sailStates.de;

	Cl = (1.400015)*sailStates.alpha + (0.416396)*sailStates.beta + (-0.839365)*sailStates.p + (7.639397)*sailStates.q + (-1.688612)*sailStates.r + (-0.000269)*sailStates.de;
	Cm = (-11.994291)*sailStates.alpha + (-0.622284)*sailStates.beta + (5.979282)*sailStates.p + (-122.911674)*sailStates.q + (6.850045)*sailStates.r + (-0.066547)*sailStates.de;
	Cn = (-0.723856)*sailStates.alpha + (0.072355)*sailStates.beta + (1.627437)*sailStates.p + (-7.160594)*sailStates.q + (0.020805)*sailStates.r + (-0.000233)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end