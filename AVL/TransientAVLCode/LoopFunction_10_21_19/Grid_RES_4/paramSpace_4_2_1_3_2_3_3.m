function [aeroForces] = paramSpace_4_2_1_3_2_3_3(sailStates,airStates)

	CL = (4.190919)*sailStates.alpha + (0.114045)*sailStates.beta + (-2.781969)*sailStates.p + (39.675007)*sailStates.q + (1.735024)*sailStates.r + (0.011357)*sailStates.de;
	CD = -0.184390;
	CY = (0.033502)*sailStates.alpha + (-0.025163)*sailStates.beta + (0.533896)*sailStates.p + (-0.194782)*sailStates.q + (-0.106178)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.409251)*sailStates.alpha + (-0.220384)*sailStates.beta + (-1.400993)*sailStates.p + (12.698648)*sailStates.q + (1.340703)*sailStates.r + (0.000709)*sailStates.de;
	Cm = (-13.022256)*sailStates.alpha + (-0.392368)*sailStates.beta + (8.563963)*sailStates.p + (-141.871536)*sailStates.q + (-5.746227)*sailStates.r + (-0.068406)*sailStates.de;
	Cn = (-0.267013)*sailStates.alpha + (0.051290)*sailStates.beta + (-0.985707)*sailStates.p + (3.767402)*sailStates.q + (-0.015481)*sailStates.r + (0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end