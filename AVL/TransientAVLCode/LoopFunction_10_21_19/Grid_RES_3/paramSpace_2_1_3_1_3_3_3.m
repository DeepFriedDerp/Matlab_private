function [aeroForces] = paramSpace_2_1_3_1_3_3_3(sailStates,airStates)

	CL = (5.189341)*sailStates.alpha + (0.431626)*sailStates.beta + (-3.451512)*sailStates.p + (41.881779)*sailStates.q + (1.787348)*sailStates.r + (0.011424)*sailStates.de;
	CD = -1.800630;
	CY = (0.502374)*sailStates.alpha + (-0.024405)*sailStates.beta + (0.797520)*sailStates.p + (1.697132)*sailStates.q + (0.000159)*sailStates.r + (0.000370)*sailStates.de;

	Cl = (1.328339)*sailStates.alpha + (-0.359080)*sailStates.beta + (-1.975992)*sailStates.p + (16.955708)*sailStates.q + (1.747945)*sailStates.r + (0.001643)*sailStates.de;
	Cm = (-12.309625)*sailStates.alpha + (-1.789545)*sailStates.beta + (11.758264)*sailStates.p + (-161.037445)*sailStates.q + (-6.137657)*sailStates.r + (-0.072227)*sailStates.de;
	Cn = (-1.244217)*sailStates.alpha + (-0.000464)*sailStates.beta + (-1.825941)*sailStates.p + (6.945316)*sailStates.q + (-0.000547)*sailStates.r + (-0.000325)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end