function [aeroForces] = paramSpace_2_2_4_3_3_1_3(sailStates,airStates)

	CL = (4.378266)*sailStates.alpha + (-0.070739)*sailStates.beta + (-2.839315)*sailStates.p + (37.860817)*sailStates.q + (-1.136511)*sailStates.r + (0.011372)*sailStates.de;
	CD = -0.233810;
	CY = (0.023196)*sailStates.alpha + (-0.025117)*sailStates.beta + (-0.452480)*sailStates.p + (0.563442)*sailStates.q + (-0.029598)*sailStates.r + (0.000122)*sailStates.de;

	Cl = (1.532344)*sailStates.alpha + (0.178386)*sailStates.beta + (-1.439410)*sailStates.p + (12.174965)*sailStates.q + (-0.938133)*sailStates.r + (0.000721)*sailStates.de;
	Cm = (-14.530699)*sailStates.alpha + (0.240619)*sailStates.beta + (9.428443)*sailStates.p + (-144.107025)*sailStates.q + (3.811215)*sailStates.r + (-0.070783)*sailStates.de;
	Cn = (0.048276)*sailStates.alpha + (0.013656)*sailStates.beta + (0.932845)*sailStates.p + (-4.483159)*sailStates.q + (0.005493)*sailStates.r + (-0.000266)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end