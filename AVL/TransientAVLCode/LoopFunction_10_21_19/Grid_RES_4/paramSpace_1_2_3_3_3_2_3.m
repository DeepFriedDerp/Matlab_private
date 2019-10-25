function [aeroForces] = paramSpace_1_2_3_3_3_2_3(sailStates,airStates)

	CL = (3.929066)*sailStates.alpha + (-0.075753)*sailStates.beta + (-2.716773)*sailStates.p + (37.475235)*sailStates.q + (-1.208174)*sailStates.r + (0.010802)*sailStates.de;
	CD = 0.048540;
	CY = (0.052603)*sailStates.alpha + (-0.025680)*sailStates.beta + (-0.323181)*sailStates.p + (0.684401)*sailStates.q + (-0.064260)*sailStates.r + (0.000146)*sailStates.de;

	Cl = (1.373872)*sailStates.alpha + (0.107016)*sailStates.beta + (-1.375823)*sailStates.p + (12.111397)*sailStates.q + (-0.854078)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-13.723461)*sailStates.alpha + (0.260077)*sailStates.beta + (8.818474)*sailStates.p + (-141.172913)*sailStates.q + (4.028601)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (0.171459)*sailStates.alpha + (0.026209)*sailStates.beta + (0.482179)*sailStates.p + (-1.800867)*sailStates.q + (-0.019612)*sailStates.r + (-0.000244)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end