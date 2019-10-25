function [aeroForces] = paramSpace_1_4_4_2_3_1_2(sailStates,airStates)

	CL = (4.806664)*sailStates.alpha + (0.436914)*sailStates.beta + (-2.517258)*sailStates.p + (38.668156)*sailStates.q + (-2.182415)*sailStates.r + (0.011307)*sailStates.de;
	CD = -0.629360;
	CY = (0.105272)*sailStates.alpha + (-0.022615)*sailStates.beta + (-0.787359)*sailStates.p + (0.756268)*sailStates.q + (-0.156534)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.569268)*sailStates.alpha + (0.500359)*sailStates.beta + (-1.118090)*sailStates.p + (10.224653)*sailStates.q + (-1.735288)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-12.734902)*sailStates.alpha + (-1.533957)*sailStates.beta + (7.195956)*sailStates.p + (-132.741791)*sailStates.q + (7.203891)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (-0.222718)*sailStates.alpha + (0.066940)*sailStates.beta + (1.603073)*sailStates.p + (-7.279338)*sailStates.q + (0.017571)*sailStates.r + (-0.000357)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end