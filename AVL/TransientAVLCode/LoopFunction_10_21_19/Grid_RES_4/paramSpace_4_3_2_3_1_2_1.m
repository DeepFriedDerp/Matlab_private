function [aeroForces] = paramSpace_4_3_2_3_1_2_1(sailStates,airStates)

	CL = (3.933546)*sailStates.alpha + (-0.066525)*sailStates.beta + (-2.215342)*sailStates.p + (33.201660)*sailStates.q + (1.006827)*sailStates.r + (0.010556)*sailStates.de;
	CD = 0.040640;
	CY = (-0.067069)*sailStates.alpha + (-0.024673)*sailStates.beta + (0.261342)*sailStates.p + (-0.294836)*sailStates.q + (-0.051974)*sailStates.r + (-0.000062)*sailStates.de;

	Cl = (1.092767)*sailStates.alpha + (-0.139437)*sailStates.beta + (-0.932712)*sailStates.p + (7.751023)*sailStates.q + (0.682899)*sailStates.r + (-0.000073)*sailStates.de;
	Cm = (-13.724868)*sailStates.alpha + (0.229168)*sailStates.beta + (7.198890)*sailStates.p + (-127.124184)*sailStates.q + (-3.360440)*sailStates.r + (-0.066937)*sailStates.de;
	Cn = (0.093117)*sailStates.alpha + (0.023801)*sailStates.beta + (-0.441241)*sailStates.p + (1.777726)*sailStates.q + (-0.011216)*sailStates.r + (0.000118)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end