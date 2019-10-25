function [aeroForces] = paramSpace_1_3_4_3_3_2_1(sailStates,airStates)

	CL = (3.966342)*sailStates.alpha + (0.059535)*sailStates.beta + (-2.215997)*sailStates.p + (33.153294)*sailStates.q + (-0.998649)*sailStates.r + (0.010643)*sailStates.de;
	CD = 0.035550;
	CY = (0.065459)*sailStates.alpha + (-0.024693)*sailStates.beta + (-0.246956)*sailStates.p + (0.294836)*sailStates.q + (-0.049091)*sailStates.r + (0.000062)*sailStates.de;

	Cl = (1.090589)*sailStates.alpha + (0.132154)*sailStates.beta + (-0.933044)*sailStates.p + (7.748785)*sailStates.q + (-0.659610)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-13.924179)*sailStates.alpha + (-0.185092)*sailStates.beta + (7.208069)*sailStates.p + (-127.124184)*sailStates.q + (3.314289)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (-0.089391)*sailStates.alpha + (0.022417)*sailStates.beta + (0.419610)*sailStates.p + (-1.766474)*sailStates.q + (-0.011160)*sailStates.r + (-0.000126)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end