function [aeroForces] = paramSpace_2_1_3_1_3_3_1(sailStates,airStates)

	CL = (5.225841)*sailStates.alpha + (0.430630)*sailStates.beta + (-1.673838)*sailStates.p + (27.570679)*sailStates.q + (1.783614)*sailStates.r + (0.010572)*sailStates.de;
	CD = -1.799900;
	CY = (-0.080859)*sailStates.alpha + (-0.024405)*sailStates.beta + (0.796884)*sailStates.p + (1.697131)*sailStates.q + (0.000159)*sailStates.r + (0.000359)*sailStates.de;

	Cl = (0.581071)*sailStates.alpha + (-0.361488)*sailStates.beta + (-0.524688)*sailStates.p + (3.550639)*sailStates.q + (1.745843)*sailStates.r + (-0.000690)*sailStates.de;
	Cm = (-12.562140)*sailStates.alpha + (-1.783784)*sailStates.beta + (5.800461)*sailStates.p + (-112.341370)*sailStates.q + (-6.114219)*sailStates.r + (-0.067299)*sailStates.de;
	Cn = (1.369288)*sailStates.alpha + (-0.000445)*sailStates.beta + (-1.825006)*sailStates.p + (6.945869)*sailStates.q + (-0.000528)*sailStates.r + (-0.000363)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end