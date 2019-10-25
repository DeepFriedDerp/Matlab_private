function [aeroForces] = paramSpace_4_1_1_1_3_1_1(sailStates,airStates)

	CL = (6.513772)*sailStates.alpha + (-0.454400)*sailStates.beta + (-1.488865)*sailStates.p + (19.471315)*sailStates.q + (-2.052795)*sailStates.r + (0.008682)*sailStates.de;
	CD = -2.709870;
	CY = (0.680200)*sailStates.alpha + (-0.018106)*sailStates.beta + (-1.203025)*sailStates.p + (2.326708)*sailStates.q + (0.239047)*sailStates.r + (0.000482)*sailStates.de;

	Cl = (1.961786)*sailStates.alpha + (0.363466)*sailStates.beta + (-0.479096)*sailStates.p + (1.503985)*sailStates.q + (-2.071439)*sailStates.r + (-0.000540)*sailStates.de;
	Cm = (-18.488638)*sailStates.alpha + (1.810600)*sailStates.beta + (7.411908)*sailStates.p + (-112.315697)*sailStates.q + (6.691542)*sailStates.r + (-0.064697)*sailStates.de;
	Cn = (-2.567104)*sailStates.alpha + (-0.118895)*sailStates.beta + (2.721855)*sailStates.p + (-13.948580)*sailStates.q + (-0.110426)*sailStates.r + (-0.000835)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end