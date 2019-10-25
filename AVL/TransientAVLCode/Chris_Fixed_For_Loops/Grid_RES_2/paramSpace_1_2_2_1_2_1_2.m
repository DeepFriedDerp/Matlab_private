function [aeroForces] = paramSpace_1_2_2_1_2_1_2(sailStates,airStates)

	CL = (5.518647)*sailStates.alpha + (-0.880096)*sailStates.beta + (-6.333786)*sailStates.p + (57.077347)*sailStates.q + (2.673007)*sailStates.r + (0.011194)*sailStates.de;
	CD = -9.246730;
	CY = (3.138102)*sailStates.alpha + (-0.018797)*sailStates.beta + (1.514833)*sailStates.p + (4.644341)*sailStates.q + (0.200747)*sailStates.r + (0.001060)*sailStates.de;

	Cl = (-2.026133)*sailStates.alpha + (-1.099885)*sailStates.beta + (-4.397003)*sailStates.p + (37.843403)*sailStates.q + (2.915761)*sailStates.r + (0.005890)*sailStates.de;
	Cm = (10.936699)*sailStates.alpha + (3.812690)*sailStates.beta + (23.751028)*sailStates.p + (-246.973099)*sailStates.q + (-9.143438)*sailStates.r + (-0.083816)*sailStates.de;
	Cn = (-11.928664)*sailStates.alpha + (-0.109174)*sailStates.beta + (-4.079830)*sailStates.p + (17.138458)*sailStates.q + (-0.081973)*sailStates.r + (-0.000923)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end