function [aeroForces] = paramSpace_1_1_1_1_2_2_3(sailStates,airStates)

	CL = (3.469357)*sailStates.alpha + (-0.224659)*sailStates.beta + (-3.344462)*sailStates.p + (42.304508)*sailStates.q + (-1.193614)*sailStates.r + (0.010949)*sailStates.de;
	CD = 0.095930;
	CY = (-0.041802)*sailStates.alpha + (-0.026462)*sailStates.beta + (-0.310650)*sailStates.p + (0.589407)*sailStates.q + (-0.054832)*sailStates.r + (0.000127)*sailStates.de;

	Cl = (1.360506)*sailStates.alpha + (0.051414)*sailStates.beta + (-1.913486)*sailStates.p + (17.084122)*sailStates.q + (-0.890504)*sailStates.r + (0.001595)*sailStates.de;
	Cm = (-12.377522)*sailStates.alpha + (0.871875)*sailStates.beta + (11.045856)*sailStates.p + (-158.590912)*sailStates.q + (4.040237)*sailStates.r + (-0.070050)*sailStates.de;
	Cn = (0.511317)*sailStates.alpha + (0.019594)*sailStates.beta + (0.365131)*sailStates.p + (-0.681161)*sailStates.q + (-0.033283)*sailStates.r + (-0.000189)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end