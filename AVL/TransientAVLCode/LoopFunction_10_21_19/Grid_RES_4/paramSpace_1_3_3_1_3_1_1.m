function [aeroForces] = paramSpace_1_3_3_1_3_1_1(sailStates,airStates)

	CL = (7.459600)*sailStates.alpha + (0.244001)*sailStates.beta + (-1.749050)*sailStates.p + (36.199844)*sailStates.q + (-3.318019)*sailStates.r + (0.011836)*sailStates.de;
	CD = -2.988650;
	CY = (0.688317)*sailStates.alpha + (-0.023945)*sailStates.beta + (-1.405883)*sailStates.p + (1.002335)*sailStates.q + (-0.279612)*sailStates.r + (0.000209)*sailStates.de;

	Cl = (2.295536)*sailStates.alpha + (0.731179)*sailStates.beta + (-0.471101)*sailStates.p + (5.151128)*sailStates.q + (-2.820453)*sailStates.r + (-0.000927)*sailStates.de;
	Cm = (-10.513183)*sailStates.alpha + (-0.905819)*sailStates.beta + (3.380765)*sailStates.p + (-108.591927)*sailStates.q + (10.933360)*sailStates.r + (-0.065315)*sailStates.de;
	Cn = (-2.659534)*sailStates.alpha + (0.126611)*sailStates.beta + (3.126652)*sailStates.p + (-14.856921)*sailStates.q + (0.079492)*sailStates.r + (-0.000483)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end