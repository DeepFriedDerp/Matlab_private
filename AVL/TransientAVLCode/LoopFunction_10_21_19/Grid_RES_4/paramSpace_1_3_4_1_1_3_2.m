function [aeroForces] = paramSpace_1_3_4_1_1_3_2(sailStates,airStates)

	CL = (6.756455)*sailStates.alpha + (-0.135860)*sailStates.beta + (-2.360337)*sailStates.p + (27.002789)*sailStates.q + (1.704492)*sailStates.r + (0.009204)*sailStates.de;
	CD = -2.618760;
	CY = (-0.164764)*sailStates.alpha + (-0.026573)*sailStates.beta + (1.096607)*sailStates.p + (-1.664520)*sailStates.q + (0.217950)*sailStates.r + (-0.000353)*sailStates.de;

	Cl = (2.404049)*sailStates.alpha + (-0.519246)*sailStates.beta + (-1.124649)*sailStates.p + (7.524025)*sailStates.q + (1.799435)*sailStates.r + (0.000402)*sailStates.de;
	Cm = (-18.654406)*sailStates.alpha + (0.551932)*sailStates.beta + (10.228879)*sailStates.p + (-137.222183)*sailStates.q + (-5.539583)*sailStates.r + (-0.067926)*sailStates.de;
	Cn = (0.898648)*sailStates.alpha + (-0.089343)*sailStates.beta + (-2.627321)*sailStates.p + (13.612144)*sailStates.q + (-0.120306)*sailStates.r + (0.000672)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end