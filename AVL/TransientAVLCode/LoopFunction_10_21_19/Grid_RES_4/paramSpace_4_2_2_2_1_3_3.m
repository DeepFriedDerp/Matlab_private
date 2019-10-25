function [aeroForces] = paramSpace_4_2_2_2_1_3_3(sailStates,airStates)

	CL = (4.785888)*sailStates.alpha + (0.160722)*sailStates.beta + (-2.922888)*sailStates.p + (42.287167)*sailStates.q + (2.354081)*sailStates.r + (0.011589)*sailStates.de;
	CD = -0.644160;
	CY = (-0.002171)*sailStates.alpha + (-0.026064)*sailStates.beta + (0.851113)*sailStates.p + (-1.057316)*sailStates.q + (-0.169259)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.807779)*sailStates.alpha + (-0.330461)*sailStates.beta + (-1.507609)*sailStates.p + (14.157471)*sailStates.q + (1.903591)*sailStates.r + (0.000840)*sailStates.de;
	Cm = (-12.671058)*sailStates.alpha + (-0.582177)*sailStates.beta + (8.500170)*sailStates.p + (-144.624481)*sailStates.q + (-7.793391)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.426124)*sailStates.alpha + (0.077551)*sailStates.beta + (-1.650858)*sailStates.p + (7.216872)*sailStates.q + (0.009301)*sailStates.r + (0.000457)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end