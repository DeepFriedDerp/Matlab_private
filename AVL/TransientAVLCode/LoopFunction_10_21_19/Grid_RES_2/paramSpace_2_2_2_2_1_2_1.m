function [aeroForces] = paramSpace_2_2_2_2_1_2_1(sailStates,airStates)

	CL = (4.219670)*sailStates.alpha + (-0.194852)*sailStates.beta + (-2.334822)*sailStates.p + (34.603809)*sailStates.q + (1.259070)*sailStates.r + (0.010919)*sailStates.de;
	CD = -0.159950;
	CY = (-0.080696)*sailStates.alpha + (-0.024437)*sailStates.beta + (0.464346)*sailStates.p + (-0.299437)*sailStates.q + (-0.061154)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.208877)*sailStates.alpha + (-0.272073)*sailStates.beta + (-0.986190)*sailStates.p + (8.131944)*sailStates.q + (1.016953)*sailStates.r + (-0.000043)*sailStates.de;
	Cm = (-13.633581)*sailStates.alpha + (0.764900)*sailStates.beta + (7.477633)*sailStates.p + (-129.699127)*sailStates.q + (-4.251892)*sailStates.r + (-0.068159)*sailStates.de;
	Cn = (0.270163)*sailStates.alpha + (0.027669)*sailStates.beta + (-0.921364)*sailStates.p + (3.984126)*sailStates.q + (0.004407)*sailStates.r + (0.000146)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end