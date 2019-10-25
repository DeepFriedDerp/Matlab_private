function [aeroForces] = paramSpace_2_2_4_3_3_3_3(sailStates,airStates)

	CL = (4.154727)*sailStates.alpha + (0.030872)*sailStates.beta + (-2.805260)*sailStates.p + (36.299061)*sailStates.q + (0.168439)*sailStates.r + (0.011057)*sailStates.de;
	CD = -0.117210;
	CY = (0.087374)*sailStates.alpha + (-0.025117)*sailStates.beta + (0.164179)*sailStates.p + (0.563442)*sailStates.q + (0.010820)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.363253)*sailStates.alpha + (-0.101196)*sailStates.beta + (-1.428638)*sailStates.p + (11.762630)*sailStates.q + (0.282885)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.860400)*sailStates.alpha + (-0.158317)*sailStates.beta + (9.718372)*sailStates.p + (-144.107025)*sailStates.q + (-0.612262)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (-0.010428)*sailStates.alpha + (-0.007159)*sailStates.beta + (-0.451806)*sailStates.p + (1.807860)*sailStates.q + (-0.005335)*sailStates.r + (-0.000142)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end