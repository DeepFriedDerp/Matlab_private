function [aeroForces] = paramSpace_1_2_1_1_3_2_2(sailStates,airStates)

	CL = (4.129253)*sailStates.alpha + (-0.098828)*sailStates.beta + (-2.430021)*sailStates.p + (35.629063)*sailStates.q + (-1.424962)*sailStates.r + (0.010495)*sailStates.de;
	CD = -0.011390;
	CY = (0.221556)*sailStates.alpha + (-0.026920)*sailStates.beta + (-0.507814)*sailStates.p + (1.664520)*sailStates.q + (-0.101189)*sailStates.r + (0.000352)*sailStates.de;

	Cl = (1.506700)*sailStates.alpha + (0.156479)*sailStates.beta + (-1.147765)*sailStates.p + (10.195370)*sailStates.q + (-1.065409)*sailStates.r + (0.000263)*sailStates.de;
	Cm = (-13.652366)*sailStates.alpha + (0.379213)*sailStates.beta + (7.587186)*sailStates.p + (-132.472137)*sailStates.q + (4.762205)*sailStates.r + (-0.067452)*sailStates.de;
	Cn = (-0.160696)*sailStates.alpha + (0.038915)*sailStates.beta + (0.895984)*sailStates.p + (-4.445481)*sailStates.q + (0.011710)*sailStates.r + (-0.000523)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end