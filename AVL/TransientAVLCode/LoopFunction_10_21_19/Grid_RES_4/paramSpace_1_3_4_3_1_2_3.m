function [aeroForces] = paramSpace_1_3_4_3_1_2_3(sailStates,airStates)

	CL = (3.840645)*sailStates.alpha + (0.057025)*sailStates.beta + (-2.746489)*sailStates.p + (37.265045)*sailStates.q + (-0.948408)*sailStates.r + (0.010898)*sailStates.de;
	CD = 0.072130;
	CY = (-0.054349)*sailStates.alpha + (-0.025259)*sailStates.beta + (-0.153018)*sailStates.p + (-0.294836)*sailStates.q + (-0.030469)*sailStates.r + (-0.000063)*sailStates.de;

	Cl = (1.232059)*sailStates.alpha + (0.109205)*sailStates.beta + (-1.362648)*sailStates.p + (11.661196)*sailStates.q + (-0.618266)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-13.858942)*sailStates.alpha + (-0.177084)*sailStates.beta + (9.164115)*sailStates.p + (-142.570129)*sailStates.q + (3.167192)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (0.256090)*sailStates.alpha + (0.019290)*sailStates.beta + (0.138277)*sailStates.p + (0.359348)*sailStates.q + (-0.041812)*sailStates.r + (0.000047)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end