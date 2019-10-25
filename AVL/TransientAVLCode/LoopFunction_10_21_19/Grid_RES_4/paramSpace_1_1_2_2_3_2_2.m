function [aeroForces] = paramSpace_1_1_2_2_3_2_2(sailStates,airStates)

	CL = (3.906154)*sailStates.alpha + (-0.241417)*sailStates.beta + (-2.438612)*sailStates.p + (35.162243)*sailStates.q + (-1.176678)*sailStates.r + (0.010427)*sailStates.de;
	CD = 0.041090;
	CY = (0.097533)*sailStates.alpha + (-0.027271)*sailStates.beta + (-0.347339)*sailStates.p + (0.756269)*sailStates.q + (-0.069117)*sailStates.r + (0.000159)*sailStates.de;

	Cl = (1.348549)*sailStates.alpha + (0.064243)*sailStates.beta + (-1.187356)*sailStates.p + (10.465865)*sailStates.q + (-0.852164)*sailStates.r + (0.000404)*sailStates.de;
	Cm = (-13.436907)*sailStates.alpha + (0.889707)*sailStates.beta + (7.845558)*sailStates.p + (-132.741776)*sailStates.q + (3.938124)*sailStates.r + (-0.066554)*sailStates.de;
	Cn = (0.019387)*sailStates.alpha + (0.028285)*sailStates.beta + (0.561060)*sailStates.p + (-2.283835)*sailStates.q + (-0.010912)*sailStates.r + (-0.000251)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end