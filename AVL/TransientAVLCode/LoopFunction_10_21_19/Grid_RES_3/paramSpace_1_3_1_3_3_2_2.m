function [aeroForces] = paramSpace_1_3_1_3_3_2_2(sailStates,airStates)

	CL = (3.879435)*sailStates.alpha + (0.202408)*sailStates.beta + (-2.472001)*sailStates.p + (35.133717)*sailStates.q + (-1.012308)*sailStates.r + (0.010499)*sailStates.de;
	CD = 0.061500;
	CY = (0.062715)*sailStates.alpha + (-0.023471)*sailStates.beta + (-0.294733)*sailStates.p + (0.491627)*sailStates.q + (-0.052016)*sailStates.r + (0.000104)*sailStates.de;

	Cl = (1.190732)*sailStates.alpha + (0.183801)*sailStates.beta + (-1.115946)*sailStates.p + (9.316236)*sailStates.q + (-0.727809)*sailStates.r + (0.000188)*sailStates.de;
	Cm = (-13.550627)*sailStates.alpha + (-0.795048)*sailStates.beta + (8.098816)*sailStates.p + (-133.990982)*sailStates.q + (3.421434)*sailStates.r + (-0.067390)*sailStates.de;
	Cn = (-0.003937)*sailStates.alpha + (0.022505)*sailStates.beta + (0.472864)*sailStates.p + (-1.828550)*sailStates.q + (-0.010400)*sailStates.r + (-0.000161)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end