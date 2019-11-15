function [aeroForces] = paramSpace_4_2_4_3_3_2_3(sailStates,airStates)

	CL = (3.718827)*sailStates.alpha + (0.077901)*sailStates.beta + (-2.744118)*sailStates.p + (37.411610)*sailStates.q + (0.975190)*sailStates.r + (0.010631)*sailStates.de;
	CD = 0.109060;
	CY = (0.059228)*sailStates.alpha + (-0.024632)*sailStates.beta + (0.196645)*sailStates.p + (0.294836)*sailStates.q + (-0.039083)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.263412)*sailStates.alpha + (-0.087454)*sailStates.beta + (-1.393059)*sailStates.p + (12.064796)*sailStates.q + (0.695744)*sailStates.r + (0.000742)*sailStates.de;
	Cm = (-13.244603)*sailStates.alpha + (-0.310828)*sailStates.beta + (9.133312)*sailStates.p + (-142.570129)*sailStates.q + (-3.322049)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.290969)*sailStates.alpha + (0.019802)*sailStates.beta + (-0.197767)*sailStates.p + (-0.404939)*sailStates.q + (-0.044259)*sailStates.r + (-0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end