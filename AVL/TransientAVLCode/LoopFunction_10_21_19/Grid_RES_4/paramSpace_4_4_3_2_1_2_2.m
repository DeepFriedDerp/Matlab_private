function [aeroForces] = paramSpace_4_4_3_2_1_2_2(sailStates,airStates)

	CL = (3.906154)*sailStates.alpha + (-0.241417)*sailStates.beta + (-2.438612)*sailStates.p + (35.162243)*sailStates.q + (1.176678)*sailStates.r + (0.010427)*sailStates.de;
	CD = 0.041090;
	CY = (-0.097533)*sailStates.alpha + (-0.022301)*sailStates.beta + (0.347339)*sailStates.p + (-0.756269)*sailStates.q + (-0.069117)*sailStates.r + (-0.000159)*sailStates.de;

	Cl = (1.210270)*sailStates.alpha + (-0.216652)*sailStates.beta + (-1.092983)*sailStates.p + (9.277986)*sailStates.q + (0.833350)*sailStates.r + (0.000150)*sailStates.de;
	Cm = (-13.436907)*sailStates.alpha + (0.889707)*sailStates.beta + (7.845557)*sailStates.p + (-132.741791)*sailStates.q + (-3.938125)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.047096)*sailStates.alpha + (0.027588)*sailStates.beta + (-0.579832)*sailStates.p + (2.520119)*sailStates.q + (-0.007169)*sailStates.r + (0.000251)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end