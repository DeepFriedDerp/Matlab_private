function [aeroForces] = paramSpace_4_4_4_2_2_3_3(sailStates,airStates)

	CL = (4.334445)*sailStates.alpha + (-0.494285)*sailStates.beta + (-2.924678)*sailStates.p + (41.991405)*sailStates.q + (2.171141)*sailStates.r + (0.011250)*sailStates.de;
	CD = -0.487570;
	CY = (0.089646)*sailStates.alpha + (-0.023734)*sailStates.beta + (0.758202)*sailStates.p + (-0.301043)*sailStates.q + (-0.150848)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.436288)*sailStates.alpha + (-0.508308)*sailStates.beta + (-1.448934)*sailStates.p + (13.254636)*sailStates.q + (1.774295)*sailStates.r + (0.000711)*sailStates.de;
	Cm = (-11.660128)*sailStates.alpha + (1.913600)*sailStates.beta + (8.676124)*sailStates.p + (-144.677322)*sailStates.q + (-7.247666)*sailStates.r + (-0.067779)*sailStates.de;
	Cn = (-0.422452)*sailStates.alpha + (0.071127)*sailStates.beta + (-1.451203)*sailStates.p + (5.670641)*sailStates.q + (-0.007210)*sailStates.r + (0.000197)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end