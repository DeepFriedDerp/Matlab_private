function [aeroForces] = paramSpace_4_2_1_3_1_1_1(sailStates,airStates)

	CL = (3.970754)*sailStates.alpha + (0.008344)*sailStates.beta + (-2.166060)*sailStates.p + (30.824028)*sailStates.q + (0.337428)*sailStates.r + (0.010184)*sailStates.de;
	CD = -0.069340;
	CY = (-0.029607)*sailStates.alpha + (-0.025259)*sailStates.beta + (-0.056098)*sailStates.p + (-0.294836)*sailStates.q + (0.011190)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.079074)*sailStates.alpha + (0.046208)*sailStates.beta + (-0.948803)*sailStates.p + (7.530777)*sailStates.q + (0.052543)*sailStates.r + (0.000012)*sailStates.de;
	Cm = (-14.746949)*sailStates.alpha + (0.010964)*sailStates.beta + (7.640484)*sailStates.p + (-127.124184)*sailStates.q + (-1.140395)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.184320)*sailStates.alpha + (-0.009151)*sailStates.beta + (0.276199)*sailStates.p + (-1.404176)*sailStates.q + (-0.028217)*sailStates.r + (0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end