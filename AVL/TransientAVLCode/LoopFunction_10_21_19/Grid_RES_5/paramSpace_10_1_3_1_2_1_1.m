function [aeroForces] = paramSpace_10_1_3_1_2_1_1(sailStates,airStates)

	CL = (4.974031)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.032331)*sailStates.p + (29.187853)*sailStates.q + (-1.248249)*sailStates.r + (0.010477)*sailStates.de;
	CD = -0.889470;
	CY = (0.280667)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.697155)*sailStates.p + (1.113124)*sailStates.q + (0.048789)*sailStates.r + (0.000238)*sailStates.de;

	Cl = (1.397151)*sailStates.alpha + (0.303602)*sailStates.beta + (-0.786952)*sailStates.p + (5.479694)*sailStates.q + (-1.209869)*sailStates.r + (-0.000299)*sailStates.de;
	Cm = (-15.665732)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.474838)*sailStates.p + (-123.764404)*sailStates.q + (4.203135)*sailStates.r + (-0.068848)*sailStates.de;
	Cn = (-1.042073)*sailStates.alpha + (-0.021230)*sailStates.beta + (1.580363)*sailStates.p + (-8.151784)*sailStates.q + (-0.022128)*sailStates.r + (-0.000444)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end