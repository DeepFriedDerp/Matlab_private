function [aeroForces] = paramSpace_4_3_4_3_3_2_3(sailStates,airStates)

	CL = (3.718827)*sailStates.alpha + (-0.077901)*sailStates.beta + (-2.744118)*sailStates.p + (37.411610)*sailStates.q + (0.975190)*sailStates.r + (0.010631)*sailStates.de;
	CD = 0.109060;
	CY = (0.059228)*sailStates.alpha + (-0.025320)*sailStates.beta + (0.196645)*sailStates.p + (0.294836)*sailStates.q + (-0.039083)*sailStates.r + (0.000063)*sailStates.de;

	Cl = (1.220630)*sailStates.alpha + (-0.131937)*sailStates.beta + (-1.361526)*sailStates.p + (11.667833)*sailStates.q + (0.689429)*sailStates.r + (0.000656)*sailStates.de;
	Cm = (-13.244605)*sailStates.alpha + (0.310828)*sailStates.beta + (9.133312)*sailStates.p + (-142.570129)*sailStates.q + (-3.322048)*sailStates.r + (-0.068480)*sailStates.de;
	Cn = (-0.272480)*sailStates.alpha + (0.023837)*sailStates.beta + (-0.204039)*sailStates.p + (-0.325978)*sailStates.q + (-0.043002)*sailStates.r + (-0.000082)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end