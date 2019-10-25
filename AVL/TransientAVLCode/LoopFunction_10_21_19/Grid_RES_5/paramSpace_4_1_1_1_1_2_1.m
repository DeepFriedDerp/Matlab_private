function [aeroForces] = paramSpace_4_1_1_1_1_2_1(sailStates,airStates)

	CL = (4.725740)*sailStates.alpha + (0.000000)*sailStates.beta + (-1.977805)*sailStates.p + (27.657663)*sailStates.q + (0.962748)*sailStates.r + (0.009906)*sailStates.de;
	CD = -0.794160;
	CY = (-0.274578)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.618401)*sailStates.p + (-1.241893)*sailStates.q + (0.087043)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (1.317113)*sailStates.alpha + (-0.259396)*sailStates.beta + (-0.768294)*sailStates.p + (5.078194)*sailStates.q + (1.002338)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-15.791104)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.684716)*sailStates.p + (-123.350212)*sailStates.q + (-3.153008)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (1.023361)*sailStates.alpha + (-0.036456)*sailStates.beta + (-1.462005)*sailStates.p + (7.884037)*sailStates.q + (-0.049833)*sailStates.r + (0.000480)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end