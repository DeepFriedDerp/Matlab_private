function [aeroForces] = paramSpace_2_1_1_1_3_1_2(sailStates,airStates)

	CL = (7.623569)*sailStates.alpha + (-0.680973)*sailStates.beta + (-2.587695)*sailStates.p + (37.480259)*sailStates.q + (-3.008435)*sailStates.r + (0.011357)*sailStates.de;
	CD = -3.008490;
	CY = (0.226191)*sailStates.alpha + (-0.027130)*sailStates.beta + (-1.421080)*sailStates.p + (1.693499)*sailStates.q + (-0.093321)*sailStates.r + (0.000362)*sailStates.de;

	Cl = (2.960159)*sailStates.alpha + (0.439503)*sailStates.beta + (-1.255241)*sailStates.p + (11.049196)*sailStates.q + (-2.706230)*sailStates.r + (0.000430)*sailStates.de;
	Cm = (-15.016023)*sailStates.alpha + (2.696938)*sailStates.beta + (7.996996)*sailStates.p + (-135.354233)*sailStates.q + (10.205230)*sailStates.r + (-0.068922)*sailStates.de;
	Cn = (-0.510446)*sailStates.alpha + (0.048165)*sailStates.beta + (3.050620)*sailStates.p + (-14.722437)*sailStates.q + (0.027861)*sailStates.r + (-0.000717)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end