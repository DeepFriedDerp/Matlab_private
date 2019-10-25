function [aeroForces] = paramSpace_2_3_4_3_1_3_3(sailStates,airStates)

	CL = (4.284100)*sailStates.alpha + (-0.042932)*sailStates.beta + (-2.815288)*sailStates.p + (36.244041)*sailStates.q + (0.428711)*sailStates.r + (0.011059)*sailStates.de;
	CD = -0.206520;
	CY = (-0.017854)*sailStates.alpha + (-0.025085)*sailStates.beta + (0.325266)*sailStates.p + (-0.432841)*sailStates.q + (0.021273)*sailStates.r + (-0.000094)*sailStates.de;

	Cl = (1.428417)*sailStates.alpha + (-0.154345)*sailStates.beta + (-1.402228)*sailStates.p + (11.341348)*sailStates.q + (0.497579)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-15.082391)*sailStates.alpha + (0.199479)*sailStates.beta + (9.832760)*sailStates.p + (-144.575439)*sailStates.q + (-1.481262)*sailStates.r + (-0.070833)*sailStates.de;
	Cn = (0.106194)*sailStates.alpha + (-0.008896)*sailStates.beta + (-0.780453)*sailStates.p + (4.018450)*sailStates.q + (-0.012763)*sailStates.r + (0.000171)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end