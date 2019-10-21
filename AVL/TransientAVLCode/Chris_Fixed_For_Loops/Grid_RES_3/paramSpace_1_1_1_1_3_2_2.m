function [aeroForces] = paramSpace_1_1_1_1_3_2_2(sailStates,airStates)

	CL = (-1.082060)*sailStates.alpha + (0.136250)*sailStates.beta + (-6.775780)*sailStates.p + (63.086132)*sailStates.q + (0.624364)*sailStates.r + (0.011504)*sailStates.de;
	CD = -3.597100;
	CY = (1.799696)*sailStates.alpha + (-0.029940)*sailStates.beta + (0.711441)*sailStates.p + (3.595665)*sailStates.q + (0.125104)*sailStates.r + (0.000828)*sailStates.de;

	Cl = (-3.100048)*sailStates.alpha + (-0.504430)*sailStates.beta + (-4.815464)*sailStates.p + (42.784222)*sailStates.q + (0.964446)*sailStates.r + (0.006836)*sailStates.de;
	Cm = (14.888504)*sailStates.alpha + (-0.558111)*sailStates.beta + (24.723978)*sailStates.p + (-260.534210)*sailStates.q + (-1.936402)*sailStates.r + (-0.086358)*sailStates.de;
	Cn = (-7.454419)*sailStates.alpha + (-0.096581)*sailStates.beta + (-2.569153)*sailStates.p + (12.818182)*sailStates.q + (-0.132860)*sailStates.r + (-0.000639)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end