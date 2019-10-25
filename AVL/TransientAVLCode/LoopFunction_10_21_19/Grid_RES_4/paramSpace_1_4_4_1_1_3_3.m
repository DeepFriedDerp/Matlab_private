function [aeroForces] = paramSpace_1_4_4_1_1_3_3(sailStates,airStates)

	CL = (6.257431)*sailStates.alpha + (-0.361346)*sailStates.beta + (-3.194041)*sailStates.p + (33.998337)*sailStates.q + (1.371007)*sailStates.r + (0.009489)*sailStates.de;
	CD = -2.524650;
	CY = (0.277156)*sailStates.alpha + (-0.027664)*sailStates.beta + (0.993232)*sailStates.p + (-1.002333)*sailStates.q + (0.197459)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (2.389889)*sailStates.alpha + (-0.536154)*sailStates.beta + (-1.784039)*sailStates.p + (13.790297)*sailStates.q + (1.530971)*sailStates.r + (0.001450)*sailStates.de;
	Cm = (-16.333992)*sailStates.alpha + (1.500837)*sailStates.beta + (12.921245)*sailStates.p + (-160.076111)*sailStates.q + (-4.436955)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.655140)*sailStates.alpha + (-0.069667)*sailStates.beta + (-2.543260)*sailStates.p + (13.364779)*sailStates.q + (-0.131013)*sailStates.r + (0.000493)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end