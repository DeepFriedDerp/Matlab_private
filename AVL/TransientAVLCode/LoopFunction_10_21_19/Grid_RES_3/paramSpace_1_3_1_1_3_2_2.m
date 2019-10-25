function [aeroForces] = paramSpace_1_3_1_1_3_2_2(sailStates,airStates)

	CL = (4.119485)*sailStates.alpha + (0.239905)*sailStates.beta + (-2.440905)*sailStates.p + (35.306606)*sailStates.q + (-1.315649)*sailStates.r + (0.010494)*sailStates.de;
	CD = -0.020150;
	CY = (0.219298)*sailStates.alpha + (-0.020207)*sailStates.beta + (-0.482929)*sailStates.p + (1.671347)*sailStates.q + (-0.085312)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (1.400871)*sailStates.alpha + (0.248132)*sailStates.beta + (-1.096583)*sailStates.p + (9.370949)*sailStates.q + (-0.976569)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-13.793000)*sailStates.alpha + (-0.919518)*sailStates.beta + (7.739365)*sailStates.p + (-132.498779)*sailStates.q + (4.408651)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.216269)*sailStates.alpha + (0.026203)*sailStates.beta + (0.867406)*sailStates.p + (-4.504354)*sailStates.q + (0.014872)*sailStates.r + (-0.000523)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end