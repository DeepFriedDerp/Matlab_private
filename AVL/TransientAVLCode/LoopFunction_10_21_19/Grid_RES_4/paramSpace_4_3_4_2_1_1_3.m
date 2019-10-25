function [aeroForces] = paramSpace_4_3_4_2_1_1_3(sailStates,airStates)

	CL = (3.922807)*sailStates.alpha + (-0.015783)*sailStates.beta + (-2.766910)*sailStates.p + (35.180347)*sailStates.q + (0.326418)*sailStates.r + (0.009976)*sailStates.de;
	CD = -0.161220;
	CY = (-0.137550)*sailStates.alpha + (-0.023742)*sailStates.beta + (-0.057175)*sailStates.p + (-1.057313)*sailStates.q + (0.011259)*sailStates.r + (-0.000226)*sailStates.de;

	Cl = (1.294940)*sailStates.alpha + (0.062011)*sailStates.beta + (-1.426460)*sailStates.p + (11.862750)*sailStates.q + (0.047937)*sailStates.r + (0.000754)*sailStates.de;
	Cm = (-14.257946)*sailStates.alpha + (0.065056)*sailStates.beta + (9.816843)*sailStates.p + (-144.624466)*sailStates.q + (-1.174027)*sailStates.r + (-0.068698)*sailStates.de;
	Cn = (-0.089973)*sailStates.alpha + (-0.012453)*sailStates.beta + (0.431785)*sailStates.p + (-2.244837)*sailStates.q + (-0.039044)*sailStates.r + (0.000241)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end