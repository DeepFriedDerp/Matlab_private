function [aeroForces] = paramSpace_3_1_3_2_2_1_3(sailStates,airStates)

	CL = (4.318738)*sailStates.alpha + (-0.148154)*sailStates.beta + (-2.922858)*sailStates.p + (36.762131)*sailStates.q + (-0.620722)*sailStates.r + (0.010815)*sailStates.de;
	CD = -0.398910;
	CY = (-0.075336)*sailStates.alpha + (-0.024904)*sailStates.beta + (-0.378010)*sailStates.p + (-0.100924)*sailStates.q + (0.024773)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.527202)*sailStates.alpha + (0.153241)*sailStates.beta + (-1.567852)*sailStates.p + (13.046796)*sailStates.q + (-0.658816)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.577093)*sailStates.alpha + (0.579103)*sailStates.beta + (10.255087)*sailStates.p + (-147.195892)*sailStates.q + (2.094928)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (0.067339)*sailStates.alpha + (-0.014633)*sailStates.beta + (0.949919)*sailStates.p + (-4.641223)*sailStates.q + (-0.012355)*sailStates.r + (-0.000063)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end