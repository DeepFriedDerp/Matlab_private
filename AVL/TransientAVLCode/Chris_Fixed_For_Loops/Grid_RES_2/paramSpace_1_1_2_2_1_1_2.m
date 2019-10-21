function [aeroForces] = paramSpace_1_1_2_2_1_1_2(sailStates,airStates)

	CL = (4.273586)*sailStates.alpha + (0.555633)*sailStates.beta + (-5.423625)*sailStates.p + (52.173973)*sailStates.q + (1.716787)*sailStates.r + (0.010910)*sailStates.de;
	CD = -4.741180;
	CY = (1.739513)*sailStates.alpha + (-0.031178)*sailStates.beta + (1.032739)*sailStates.p + (3.330209)*sailStates.q + (0.136199)*sailStates.r + (0.000748)*sailStates.de;

	Cl = (-0.279888)*sailStates.alpha + (-0.553540)*sailStates.beta + (-3.711328)*sailStates.p + (32.236523)*sailStates.q + (1.917731)*sailStates.r + (0.004728)*sailStates.de;
	Cm = (-0.419195)*sailStates.alpha + (-2.343272)*sailStates.beta + (20.012997)*sailStates.p + (-220.245529)*sailStates.q + (-5.802890)*sailStates.r + (-0.079238)*sailStates.de;
	Cn = (-6.300673)*sailStates.alpha + (-0.094824)*sailStates.beta + (-2.895017)*sailStates.p + (12.637495)*sailStates.q + (-0.064940)*sailStates.r + (-0.000624)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end