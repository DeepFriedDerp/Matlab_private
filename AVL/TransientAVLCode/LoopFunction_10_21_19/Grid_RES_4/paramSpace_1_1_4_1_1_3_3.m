function [aeroForces] = paramSpace_1_1_4_1_1_3_3(sailStates,airStates)

	CL = (6.257432)*sailStates.alpha + (0.361346)*sailStates.beta + (-3.194041)*sailStates.p + (33.998337)*sailStates.q + (1.371007)*sailStates.r + (0.009489)*sailStates.de;
	CD = -2.524650;
	CY = (0.277156)*sailStates.alpha + (-0.021908)*sailStates.beta + (0.993232)*sailStates.p + (-1.002333)*sailStates.q + (0.197459)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (2.520584)*sailStates.alpha + (-0.373014)*sailStates.beta + (-1.878445)*sailStates.p + (14.978169)*sailStates.q + (1.512321)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-16.333988)*sailStates.alpha + (-1.500837)*sailStates.beta + (12.921247)*sailStates.p + (-160.076126)*sailStates.q + (-4.436954)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (-0.753106)*sailStates.alpha + (-0.111178)*sailStates.beta + (-2.562039)*sailStates.p + (13.601061)*sailStates.q + (-0.134723)*sailStates.r + (0.000493)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end