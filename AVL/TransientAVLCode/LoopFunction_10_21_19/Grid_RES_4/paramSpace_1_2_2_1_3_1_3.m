function [aeroForces] = paramSpace_1_2_2_1_3_1_3(sailStates,airStates)

	CL = (7.566692)*sailStates.alpha + (-0.282661)*sailStates.beta + (-3.452753)*sailStates.p + (50.777626)*sailStates.q + (-4.012460)*sailStates.r + (0.012617)*sailStates.de;
	CD = -3.121930;
	CY = (-0.252624)*sailStates.alpha + (-0.027531)*sailStates.beta + (-1.630754)*sailStates.p + (2.326713)*sailStates.q + (-0.324460)*sailStates.r + (0.000500)*sailStates.de;

	Cl = (3.245712)*sailStates.alpha + (0.631289)*sailStates.beta + (-1.901388)*sailStates.p + (19.024391)*sailStates.q + (-3.411600)*sailStates.r + (0.001406)*sailStates.de;
	Cm = (-11.982618)*sailStates.alpha + (1.055929)*sailStates.beta + (8.875498)*sailStates.p + (-156.352325)*sailStates.q + (13.261353)*sailStates.r + (-0.070001)*sailStates.de;
	Cn = (1.976550)*sailStates.alpha + (0.148082)*sailStates.beta + (3.302973)*sailStates.p + (-15.136087)*sailStates.q + (0.053686)*sailStates.r + (-0.000977)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end