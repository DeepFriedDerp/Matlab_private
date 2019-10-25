function [aeroForces] = paramSpace_3_2_4_1_2_3_2(sailStates,airStates)

	CL = (6.509988)*sailStates.alpha + (0.207334)*sailStates.beta + (-2.624266)*sailStates.p + (37.653084)*sailStates.q + (2.568786)*sailStates.r + (0.011531)*sailStates.de;
	CD = -2.368050;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (1.148057)*sailStates.p + (-0.000002)*sailStates.q + (-0.075248)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.940527)*sailStates.alpha + (-0.517389)*sailStates.beta + (-1.242521)*sailStates.p + (10.691759)*sailStates.q + (2.344738)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-13.568038)*sailStates.alpha + (-0.832545)*sailStates.beta + (8.257989)*sailStates.p + (-137.194580)*sailStates.q + (-8.738133)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (0.290054)*sailStates.alpha + (0.038673)*sailStates.beta + (-2.491571)*sailStates.p + (10.948100)*sailStates.q + (0.014591)*sailStates.r + (0.000193)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end