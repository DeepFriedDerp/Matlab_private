function [aeroForces] = paramSpace_1_2_1_3_3_2_2(sailStates,airStates)

	CL = (3.931943)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.488918)*sailStates.p + (35.372395)*sailStates.q + (-1.018339)*sailStates.r + (0.010643)*sailStates.de;
	CD = 0.062150;
	CY = (0.063137)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.296206)*sailStates.p + (0.491627)*sailStates.q + (-0.052276)*sailStates.r + (0.000105)*sailStates.de;

	Cl = (1.269852)*sailStates.alpha + (0.128496)*sailStates.beta + (-1.166195)*sailStates.p + (9.913545)*sailStates.q + (-0.739620)*sailStates.r + (0.000306)*sailStates.de;
	Cm = (-13.735426)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.154971)*sailStates.p + (-134.907364)*sailStates.q + (3.441925)*sailStates.r + (-0.068311)*sailStates.de;
	Cn = (0.023248)*sailStates.alpha + (0.022657)*sailStates.beta + (0.467453)*sailStates.p + (-1.739241)*sailStates.q + (-0.011875)*sailStates.r + (-0.000162)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end