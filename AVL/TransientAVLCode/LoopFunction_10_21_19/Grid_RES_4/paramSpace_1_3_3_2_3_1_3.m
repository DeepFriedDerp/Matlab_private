function [aeroForces] = paramSpace_1_3_3_2_3_1_3(sailStates,airStates)

	CL = (4.785887)*sailStates.alpha + (0.160722)*sailStates.beta + (-2.922888)*sailStates.p + (42.287167)*sailStates.q + (-2.354080)*sailStates.r + (0.011589)*sailStates.de;
	CD = -0.644160;
	CY = (0.002171)*sailStates.alpha + (-0.023888)*sailStates.beta + (-0.851113)*sailStates.p + (1.057316)*sailStates.q + (-0.169259)*sailStates.r + (0.000226)*sailStates.de;

	Cl = (1.770484)*sailStates.alpha + (0.435498)*sailStates.beta + (-1.476066)*sailStates.p + (13.760508)*sailStates.q + (-1.897331)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-12.671059)*sailStates.alpha + (-0.582177)*sailStates.beta + (8.500170)*sailStates.p + (-144.624466)*sailStates.q + (7.793391)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (0.383921)*sailStates.alpha + (0.074808)*sailStates.beta + (1.657132)*sailStates.p + (-7.295832)*sailStates.q + (0.010546)*sailStates.r + (-0.000457)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end