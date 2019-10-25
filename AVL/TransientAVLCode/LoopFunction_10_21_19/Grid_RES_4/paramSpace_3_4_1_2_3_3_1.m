function [aeroForces] = paramSpace_3_4_1_2_3_3_1(sailStates,airStates)

	CL = (4.276777)*sailStates.alpha + (-0.237109)*sailStates.beta + (-2.179315)*sailStates.p + (32.584896)*sailStates.q + (1.074162)*sailStates.r + (0.010973)*sailStates.de;
	CD = -0.340720;
	CY = (0.045182)*sailStates.alpha + (-0.025439)*sailStates.beta + (0.389032)*sailStates.p + (0.870359)*sailStates.q + (-0.025590)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (0.917819)*sailStates.alpha + (-0.296198)*sailStates.beta + (-0.834747)*sailStates.p + (6.363241)*sailStates.q + (0.925541)*sailStates.r + (-0.000295)*sailStates.de;
	Cm = (-13.712878)*sailStates.alpha + (0.851454)*sailStates.beta + (7.215999)*sailStates.p + (-125.466835)*sailStates.q + (-3.625063)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.338867)*sailStates.alpha + (0.014490)*sailStates.beta + (-0.874863)*sailStates.p + (3.362776)*sailStates.q + (0.000170)*sailStates.r + (-0.000167)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end